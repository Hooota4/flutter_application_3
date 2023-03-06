import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estates_search_state_provider.freezed.dart';
part 'real_estates_search_state_provider.g.dart';

@freezed
class Filters with _$Filters {
  factory Filters({
    required String searchQuery,
    required double priceFilter,
    required List<String> cityFilter,
    required List<String> stateFilter,
    required List<String> typeFilter,
    required List<String> opFilter,
  }) = _Filters;
}

@riverpod
class FilterState extends _$FilterState {
  @override
  Filters build() {
    update();
    return state;
  }

  void update({
    String searchQuery = "",
    double priceFilter = 0.0,
    List<String> cityFilter = const [],
    List<String> stateFilter = const [],
    List<String> typeFilter = const [],
    List<String> opFilter = const [],
  }) {
    state = Filters(
      searchQuery: searchQuery,
      priceFilter: priceFilter,
      cityFilter: cityFilter,
      stateFilter: stateFilter,
      typeFilter: typeFilter,
      opFilter: opFilter,
    );
  }
}

@riverpod
Future<List<RealEstateModel>> realEstatesSearchResults(RealEstatesSearchResultsRef ref) {
  final filterState = ref.watch(filterStateProvider);
  return ref.watch(realEstatesListSearchProvider(filterState).future);
}
