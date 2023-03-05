import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/common/helpers/http_client.dart';
import 'package:flutter_application_3/real_estates/models/filter_values.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estate_controller.g.dart';

class RealEstateRepository {
  RealEstateRepository();

  final List<RealEstateModel> _realEstates = [];

  List<RealEstateModel> getRealEstatesList() => _realEstates;

  Future<RealEstateModel?> getRealEstate(int id) async => _getRealEstate(_realEstates, id);

  Future<List<RealEstateModel>> fetchRealEstatesList() async {
    final res = await dio.get(
      '/get_real_estates',
      options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
    );
    return (res.data['data']['data'] as List<dynamic>).map((e) => RealEstateModel.fromJson(e)).toList();
  }

  Future<List<RealEstateModel>> fetchMyRealEstatesList() async {
    final res = await dio.get(
      '/my_real_estates',
      options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
    );
    return (res.data['data']['data'] as List<dynamic>).map((e) => RealEstateModel.fromJson(e)).toList();
  }

  Future<FilterValuesModel> fetchRealEstatesFiltersValues() async {
    try {
      final res = await dio.get(
        '/filters_values',
        options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
      );

      final data = ResponseModel.fromJson(res.data);
      return FilterValuesModel.fromJson(data.data as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      return const FilterValuesModel(cities: [], states: [], maxPrice: 0);
    }
  }

  Stream<List<RealEstateModel>> watchRealEstatesList() async* {
    while (true) {
      List<RealEstateModel> realEstates = await fetchRealEstatesList();
      yield realEstates;
      await Future.delayed(const Duration(milliseconds: 10000));
    }
  }

  Stream<List<RealEstateModel>> watchMyRealEstatesList() async* {
    while (true) {
      List<RealEstateModel> realEstates = await fetchRealEstatesList();
      yield realEstates;
      await Future.delayed(const Duration(milliseconds: 10000));
    }
  }

  Stream<RealEstateModel?> watchRealEstate(int id) {
    return watchRealEstatesList().map((realEstates) => _getRealEstate(realEstates, id));
  }

  Stream<FilterValuesModel> watchRealEstatesFiltersValues() async* {
    while (true) {
      FilterValuesModel filtersValues = await fetchRealEstatesFiltersValues();
      yield filtersValues;
      await Future.delayed(const Duration(milliseconds: 10000));
    }
  }

  Future<bool> setRealEstate(RealEstateModel realEstate, List<XFile> images, List<XFile> ownerShipProof) async {
    final jsonData = realEstate.toJson();

    jsonData['images'] = await Future.wait(images.map(
      (e) async => await MultipartFile.fromFile(
        File(e.path).path,
        filename: File(e.path).path.split('/').last,
      ),
    ));

    jsonData['ownerShipProof'] = await Future.wait(ownerShipProof.map(
      (e) async => await MultipartFile.fromFile(
        File(e.path).path,
        filename: File(e.path).path.split('/').last,
      ),
    ));

    // final index = _realEstates.indexWhere((p) => p.id == realEstate.id);

    if (realEstate.id == 0) {
      // if not found, add as a new realEstate
      final res = await dio.post(
        '/adding_real_estate',
        data: FormData.fromMap(jsonData),
        options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
      );

      final response = ResponseModel.fromJson(res.data);

      // _realEstates.add(realEstate);
      return response.success;
    } else {
      final res = await dio.post(
        '/update_real_estate',
        data: FormData.fromMap(jsonData),
        options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
      );

      final response = ResponseModel.fromJson(res.data);

      // else, overwrite previous realEstate
      // _realEstates[index] = realEstate;
      return response.success;
    }
  }

  Future<bool> deleteRealEstate(int id) async {
    final res = await dio.post(
      '/delete_my_estate',
      data: FormData.fromMap({'id': id}),
      options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
    );

    return ResponseModel.fromJson(res.data).success;
  }

  Future<List<RealEstateModel>> searchRealEstates(
    String query,
    double price,
    List<String> cities,
    List<String> states,
    List<String> types,
    List<String> operationsTypes,
  ) async {
    assert(
      _realEstates.length <= 100,
      'Client-side search should only be performed if the number of realEstates is small. '
      'Consider doing server-side search for larger datasets.',
    );
    // Get all realEstates
    final realEstatesList = await fetchRealEstatesList();
    if (price > 0) realEstatesList.where((realEstate) => (int.tryParse(realEstate.price) ?? 0) < price);
    if (cities.isEmpty) realEstatesList.where((realEstate) => cities.contains(realEstate.city));
    if (states.isEmpty) realEstatesList.where((realEstate) => states.contains(realEstate.state));
    if (types.isEmpty) realEstatesList.where((realEstate) => types.contains(realEstate.type));
    if (operationsTypes.isEmpty) realEstatesList.where((realEstate) => operationsTypes.contains(realEstate.operation));

    // Match all realEstates where the title contains the query
    return realEstatesList.where((realEstate) => realEstate.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  static RealEstateModel? _getRealEstate(List<RealEstateModel> realEstates, int id) {
    try {
      return realEstates.firstWhere((realEstate) => realEstate.id == id);
    } catch (e) {
      return null;
    }
  }
}

//====================================================================//

// Repo Object
@riverpod
RealEstateRepository realEstateRepository(RealEstateRepositoryRef ref) {
  return RealEstateRepository();
}

// List as stream
final realEstatesListStreamProvider = StreamProvider.autoDispose<List<RealEstateModel>>((ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchRealEstatesList();
});

// My List as stream
final myRealEstatesListStreamProvider = StreamProvider.autoDispose<List<RealEstateModel>>((ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchMyRealEstatesList();
});

// one as stream
final realEstateStreamProvider = StreamProvider.autoDispose.family<RealEstateModel?, int>((ref, id) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchRealEstate(id);
});

// filters values as stream
final realEstatesFiltersValuesStreamProvider = StreamProvider.autoDispose<FilterValuesModel>((ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchRealEstatesFiltersValues();
});

// list as future
@riverpod
Future<List<RealEstateModel>> myRealEstatesListFuture(MyRealEstatesListFutureRef ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.fetchMyRealEstatesList();
}

// list as future
@riverpod
Future<List<RealEstateModel>> realEstatesListFuture(RealEstatesListFutureRef ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.fetchRealEstatesList();
}

// one as future
@riverpod
Future<RealEstateModel?> realEstateFuture(RealEstateFutureRef ref, int id) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.getRealEstate(id);
}

// filters values as future
@riverpod
Future<FilterValuesModel> realEstateFiltersValuesFuture(RealEstateFiltersValuesFutureRef ref, int id) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.fetchRealEstatesFiltersValues();
}

// search
@riverpod
Future<List<RealEstateModel>> realEstatesListSearch(
  RealEstatesListSearchRef ref,
  String query,
  double price,
  List<String> cities,
  List<String> states,
  List<String> types,
  List<String> operationsTypes,
) async {
  final link = ref.keepAlive();
  // * keep previous search results in memory for 60 seconds
  final timer = Timer(const Duration(seconds: 60), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.searchRealEstates(
    query,
    price,
    cities,
    states,
    types,
    operationsTypes,
  );
}

// create or update
@riverpod
Future<bool> createOrUpdateRealEstate(
  CreateOrUpdateRealEstateRef ref,
  RealEstateModel realEstate,
  List<XFile> images,
  List<XFile> ownerShipProof,
) async {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.setRealEstate(realEstate, images, ownerShipProof);
}

// create or update
@riverpod
Future<bool> deleteRealEstate(DeleteRealEstateRef ref, int id) async {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.deleteRealEstate(id);
}
