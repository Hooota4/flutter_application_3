import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/common/helpers/http_client.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estate_controller.g.dart';

class RealEstateRepository {
  RealEstateRepository();

  final List<RealEstateModel> _realEstates = [];

  List<RealEstateModel> getRealEstatesList() => _realEstates;

  RealEstateModel? getRealEstate(int id) => _getRealEstate(_realEstates, id);

  Future<List<RealEstateModel>> fetchRealEstatesList() async {
    final res = await dio.get(
      '/get_real_estates',
      options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
    );
    return (res.data['data']['data'] as List<dynamic>).map((e) => RealEstateModel.fromJson(e)).toList();
  }

  Stream<List<RealEstateModel>> watchRealEstatesList() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 10000));
      List<RealEstateModel> realEstates = await fetchRealEstatesList();
      yield realEstates;
    }
  }

  Stream<RealEstateModel?> watchRealEstate(int id) {
    return watchRealEstatesList().map((realEstates) => _getRealEstate(realEstates, id));
  }

  /// Update realEstate or add a new one
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

    final index = _realEstates.indexWhere((p) => p.id == realEstate.id);

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

  /// Search for realEstates where the title contains the search query
  Future<List<RealEstateModel>> searchRealEstates(String query) async {
    assert(
      _realEstates.length <= 100,
      'Client-side search should only be performed if the number of realEstates is small. '
      'Consider doing server-side search for larger datasets.',
    );
    // Get all realEstates
    final realEstatesList = await fetchRealEstatesList();
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

@riverpod
RealEstateRepository realEstateRepository(RealEstateRepositoryRef ref) {
  return RealEstateRepository();
}

final realEstatesListStreamProvider = StreamProvider.autoDispose<List<RealEstateModel>>((ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchRealEstatesList();
});

@riverpod
Future<List<RealEstateModel>> realEstatesListFuture(RealEstatesListFutureRef ref) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.fetchRealEstatesList();
}

final pealEstateProvider = StreamProvider.autoDispose.family<RealEstateModel?, int>((ref, id) {
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.watchRealEstate(id);
});

@riverpod
Future<List<RealEstateModel>> realEstatesListSearch(RealEstatesListSearchRef ref, String query) async {
  final link = ref.keepAlive();
  // * keep previous search results in memory for 60 seconds
  final timer = Timer(const Duration(seconds: 60), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  final realEstatesRepository = ref.watch(realEstateRepositoryProvider);
  return realEstatesRepository.searchRealEstates(query);
}

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



/*
@riverpod
class RealEstateController extends _$RealEstateController {
  @override
  List<RealEstateModel> build() {
    _fetchAll();
    return [];
  }

  void _fetchAll() async {
    final res = await dio.get(
      '/get_real_estates',
      options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
    );

    state = (res.data['data']['data'] as List<dynamic>).map((e) => RealEstateModel.fromJson(e)).toList();
  }

  void filterRealEstateByName(String value) {
    state = state.where((element) => element.title.contains(value)).toList();
  }

  void filterRealEstateByPrice({double? max, double? min}) {
    if (max != null) {
      state = state.where((element) => (double.tryParse(element.price) ?? 0.0) <= max).toList();
    }

    if (min != null) {
      state = state.where((element) => (double.tryParse(element.price) ?? 0.0) >= min).toList();
    }
  }

  void filterRealEstateByType(String value) {
    state = state.where((element) => element.type.contains(value)).toList();
  }

  void filterRealEstateByCity(String value) {
    state = state.where((element) => element.city.contains(value)).toList();
  }

  void filterRealEstateByState(String value) {
    state = state.where((element) => element.state.contains(value)).toList();
  }

  void filterRealEstateByUser(int value) {
    state = state.where((element) => element.advertiser == value).toList();
  }

  Future<bool> addRealEstate({required RealEstateModel realEstate, List<XFile>? images = const []}) async {
    try {
      final jsonData = realEstate.toJson();
      jsonData['image1'] = await MultipartFile.fromFile(
        File(images![0].path).path,
        filename: File(images[0].path).path.split('/').last,
      );
      jsonData['image2'] = await MultipartFile.fromFile(
        File(images[1].path).path,
        filename: File(images[1].path).path.split('/').last,
      );
      jsonData['image3'] = await MultipartFile.fromFile(
        File(images[2].path).path,
        filename: File(images[2].path).path.split('/').last,
      );
      jsonData['ownerShipProof'] = await MultipartFile.fromFile(
        File(images[3].path).path,
        filename: File(images[3].path).path.split('/').last,
      );

      final res = await dio.post(
        '/adding_real_estate',
        data: FormData.fromMap(jsonData),
        options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
      );

      _fetchAll();
      return ResponseModel.fromJson(res.data).success;
    } catch (e) {
      return false;
    }
  }
}
*/