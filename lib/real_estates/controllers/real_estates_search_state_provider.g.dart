// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estates_search_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filterStateHash() => r'caa32401a8ce63ab1f24d5ec03840aa0432a2b6a';

/// See also [FilterState].
@ProviderFor(FilterState)
final filterStateProvider =
    AutoDisposeNotifierProvider<FilterState, Filters>.internal(
  FilterState.new,
  name: r'filterStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filterStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterState = AutoDisposeNotifier<Filters>;
String _$realEstatesSearchResultsHash() =>
    r'12ea1a02b263bb830c925b6d77c4b90716d5e200';

/// See also [realEstatesSearchResults].
@ProviderFor(realEstatesSearchResults)
final realEstatesSearchResultsProvider =
    AutoDisposeFutureProvider<List<RealEstateModel>>.internal(
  realEstatesSearchResults,
  name: r'realEstatesSearchResultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realEstatesSearchResultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealEstatesSearchResultsRef
    = AutoDisposeFutureProviderRef<List<RealEstateModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
