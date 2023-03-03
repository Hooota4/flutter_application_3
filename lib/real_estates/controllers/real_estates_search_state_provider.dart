import 'package:flutter_application_3/real_estates/controllers/real_estate_controller.dart';
import 'package:flutter_application_3/real_estates/models/real_estate_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estates_search_state_provider.g.dart';

final realEstatesSearchQueryStateProvider = StateProvider<String>((ref) {
  return '';
});

@riverpod
Future<List<RealEstateModel>> realEstatesSearchResults(RealEstatesSearchResultsRef ref) {
  final searchQuery = ref.watch(realEstatesSearchQueryStateProvider);
  return ref.watch(realEstatesListSearchProvider(searchQuery).future);
}
