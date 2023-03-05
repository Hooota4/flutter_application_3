import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estates_search_state_provider.g.dart';

final realEstatesSearchQueryStateProvider = StateProvider<String>((ref) => '');

// from api
final realEstatesPriceFilterStateProvider = StateProvider<double>((ref) => 0.0);

// from api
final realEstatesCityFilterStateProvider = StateProvider<List<String>>((ref) => []);

// from api
final realEstatesStateFilterStateProvider = StateProvider<List<String>>((ref) => []);

enum RealEstateType { all, land, farm, house, villa, store, office, building, apartment }

final realEstatesTypeFilterStateProvider = StateProvider<List<String>>((ref) => []);

enum Operation { all, sell, rent }

final realEstatesOperationFilterStateProvider = StateProvider<List<String>>((ref) => []);

@riverpod
Future<List<RealEstateModel>> realEstatesSearchResults(RealEstatesSearchResultsRef ref) {
  final searchQuery = ref.watch(realEstatesSearchQueryStateProvider);
  final priceFilter = ref.watch(realEstatesPriceFilterStateProvider);
  final cityFilter = ref.watch(realEstatesCityFilterStateProvider);
  final stateFilter = ref.watch(realEstatesStateFilterStateProvider);
  final typeFilter = ref.watch(realEstatesTypeFilterStateProvider);
  final opFilter = ref.watch(realEstatesOperationFilterStateProvider);

  return ref.watch(realEstatesListSearchProvider(
    searchQuery,
    priceFilter,
    cityFilter,
    stateFilter,
    typeFilter,
    opFilter,
  ).future);
}
