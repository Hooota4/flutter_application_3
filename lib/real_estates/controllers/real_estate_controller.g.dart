// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$realEstateRepositoryHash() =>
    r'735b7ebc80861a848f12ea211d0b68dca1c9cf78';

/// See also [realEstateRepository].
@ProviderFor(realEstateRepository)
final realEstateRepositoryProvider =
    AutoDisposeProvider<RealEstateRepository>.internal(
  realEstateRepository,
  name: r'realEstateRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realEstateRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealEstateRepositoryRef = AutoDisposeProviderRef<RealEstateRepository>;
String _$myRealEstatesListFutureHash() =>
    r'eb6823d44b402870becf8452070dd050358a8f89';

/// See also [myRealEstatesListFuture].
@ProviderFor(myRealEstatesListFuture)
final myRealEstatesListFutureProvider =
    AutoDisposeFutureProvider<List<RealEstateModel>>.internal(
  myRealEstatesListFuture,
  name: r'myRealEstatesListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myRealEstatesListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyRealEstatesListFutureRef
    = AutoDisposeFutureProviderRef<List<RealEstateModel>>;
String _$realEstatesListFutureHash() =>
    r'2b85444646bf1565aba3ff1c293b1a44e9de84cd';

/// See also [realEstatesListFuture].
@ProviderFor(realEstatesListFuture)
final realEstatesListFutureProvider =
    AutoDisposeFutureProvider<List<RealEstateModel>>.internal(
  realEstatesListFuture,
  name: r'realEstatesListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realEstatesListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RealEstatesListFutureRef
    = AutoDisposeFutureProviderRef<List<RealEstateModel>>;
String _$realEstateFutureHash() => r'd7e0f0469946a03cb51b7634380477b8e0f9100e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef RealEstateFutureRef = AutoDisposeFutureProviderRef<RealEstateModel?>;

/// See also [realEstateFuture].
@ProviderFor(realEstateFuture)
const realEstateFutureProvider = RealEstateFutureFamily();

/// See also [realEstateFuture].
class RealEstateFutureFamily extends Family<AsyncValue<RealEstateModel?>> {
  /// See also [realEstateFuture].
  const RealEstateFutureFamily();

  /// See also [realEstateFuture].
  RealEstateFutureProvider call(
    int id,
  ) {
    return RealEstateFutureProvider(
      id,
    );
  }

  @override
  RealEstateFutureProvider getProviderOverride(
    covariant RealEstateFutureProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'realEstateFutureProvider';
}

/// See also [realEstateFuture].
class RealEstateFutureProvider
    extends AutoDisposeFutureProvider<RealEstateModel?> {
  /// See also [realEstateFuture].
  RealEstateFutureProvider(
    this.id,
  ) : super.internal(
          (ref) => realEstateFuture(
            ref,
            id,
          ),
          from: realEstateFutureProvider,
          name: r'realEstateFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$realEstateFutureHash,
          dependencies: RealEstateFutureFamily._dependencies,
          allTransitiveDependencies:
              RealEstateFutureFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is RealEstateFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$realEstatesListSearchHash() =>
    r'28450b750a5cc5c4d51415d761ae017a1a2bb79a';
typedef RealEstatesListSearchRef
    = AutoDisposeFutureProviderRef<List<RealEstateModel>>;

/// See also [realEstatesListSearch].
@ProviderFor(realEstatesListSearch)
const realEstatesListSearchProvider = RealEstatesListSearchFamily();

/// See also [realEstatesListSearch].
class RealEstatesListSearchFamily
    extends Family<AsyncValue<List<RealEstateModel>>> {
  /// See also [realEstatesListSearch].
  const RealEstatesListSearchFamily();

  /// See also [realEstatesListSearch].
  RealEstatesListSearchProvider call(
    String query,
  ) {
    return RealEstatesListSearchProvider(
      query,
    );
  }

  @override
  RealEstatesListSearchProvider getProviderOverride(
    covariant RealEstatesListSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'realEstatesListSearchProvider';
}

/// See also [realEstatesListSearch].
class RealEstatesListSearchProvider
    extends AutoDisposeFutureProvider<List<RealEstateModel>> {
  /// See also [realEstatesListSearch].
  RealEstatesListSearchProvider(
    this.query,
  ) : super.internal(
          (ref) => realEstatesListSearch(
            ref,
            query,
          ),
          from: realEstatesListSearchProvider,
          name: r'realEstatesListSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$realEstatesListSearchHash,
          dependencies: RealEstatesListSearchFamily._dependencies,
          allTransitiveDependencies:
              RealEstatesListSearchFamily._allTransitiveDependencies,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is RealEstatesListSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$createOrUpdateRealEstateHash() =>
    r'd67590d7149b03b557f168741164a2d32d848e4c';
typedef CreateOrUpdateRealEstateRef = AutoDisposeFutureProviderRef<bool>;

/// See also [createOrUpdateRealEstate].
@ProviderFor(createOrUpdateRealEstate)
const createOrUpdateRealEstateProvider = CreateOrUpdateRealEstateFamily();

/// See also [createOrUpdateRealEstate].
class CreateOrUpdateRealEstateFamily extends Family<AsyncValue<bool>> {
  /// See also [createOrUpdateRealEstate].
  const CreateOrUpdateRealEstateFamily();

  /// See also [createOrUpdateRealEstate].
  CreateOrUpdateRealEstateProvider call(
    RealEstateModel realEstate,
    List<XFile> images,
    List<XFile> ownerShipProof,
  ) {
    return CreateOrUpdateRealEstateProvider(
      realEstate,
      images,
      ownerShipProof,
    );
  }

  @override
  CreateOrUpdateRealEstateProvider getProviderOverride(
    covariant CreateOrUpdateRealEstateProvider provider,
  ) {
    return call(
      provider.realEstate,
      provider.images,
      provider.ownerShipProof,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createOrUpdateRealEstateProvider';
}

/// See also [createOrUpdateRealEstate].
class CreateOrUpdateRealEstateProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createOrUpdateRealEstate].
  CreateOrUpdateRealEstateProvider(
    this.realEstate,
    this.images,
    this.ownerShipProof,
  ) : super.internal(
          (ref) => createOrUpdateRealEstate(
            ref,
            realEstate,
            images,
            ownerShipProof,
          ),
          from: createOrUpdateRealEstateProvider,
          name: r'createOrUpdateRealEstateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createOrUpdateRealEstateHash,
          dependencies: CreateOrUpdateRealEstateFamily._dependencies,
          allTransitiveDependencies:
              CreateOrUpdateRealEstateFamily._allTransitiveDependencies,
        );

  final RealEstateModel realEstate;
  final List<XFile> images;
  final List<XFile> ownerShipProof;

  @override
  bool operator ==(Object other) {
    return other is CreateOrUpdateRealEstateProvider &&
        other.realEstate == realEstate &&
        other.images == images &&
        other.ownerShipProof == ownerShipProof;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, realEstate.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);
    hash = _SystemHash.combine(hash, ownerShipProof.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
