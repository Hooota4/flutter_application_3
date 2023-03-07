// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_estates_search_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Filters {
  String get searchQuery => throw _privateConstructorUsedError;
  double get priceFilter => throw _privateConstructorUsedError;
  List<String> get cityFilter => throw _privateConstructorUsedError;
  List<String> get stateFilter => throw _privateConstructorUsedError;
  List<String> get typeFilter => throw _privateConstructorUsedError;
  List<String> get opFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res, Filters>;
  @useResult
  $Res call(
      {String searchQuery,
      double priceFilter,
      List<String> cityFilter,
      List<String> stateFilter,
      List<String> typeFilter,
      List<String> opFilter});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res, $Val extends Filters>
    implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? priceFilter = null,
    Object? cityFilter = null,
    Object? stateFilter = null,
    Object? typeFilter = null,
    Object? opFilter = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as double,
      cityFilter: null == cityFilter
          ? _value.cityFilter
          : cityFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stateFilter: null == stateFilter
          ? _value.stateFilter
          : stateFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typeFilter: null == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      opFilter: null == opFilter
          ? _value.opFilter
          : opFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$$_FiltersCopyWith(
          _$_Filters value, $Res Function(_$_Filters) then) =
      __$$_FiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      double priceFilter,
      List<String> cityFilter,
      List<String> stateFilter,
      List<String> typeFilter,
      List<String> opFilter});
}

/// @nodoc
class __$$_FiltersCopyWithImpl<$Res>
    extends _$FiltersCopyWithImpl<$Res, _$_Filters>
    implements _$$_FiltersCopyWith<$Res> {
  __$$_FiltersCopyWithImpl(_$_Filters _value, $Res Function(_$_Filters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? priceFilter = null,
    Object? cityFilter = null,
    Object? stateFilter = null,
    Object? typeFilter = null,
    Object? opFilter = null,
  }) {
    return _then(_$_Filters(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as double,
      cityFilter: null == cityFilter
          ? _value._cityFilter
          : cityFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stateFilter: null == stateFilter
          ? _value._stateFilter
          : stateFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typeFilter: null == typeFilter
          ? _value._typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
      opFilter: null == opFilter
          ? _value._opFilter
          : opFilter // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Filters implements _Filters {
  _$_Filters(
      {required this.searchQuery,
      required this.priceFilter,
      required final List<String> cityFilter,
      required final List<String> stateFilter,
      required final List<String> typeFilter,
      required final List<String> opFilter})
      : _cityFilter = cityFilter,
        _stateFilter = stateFilter,
        _typeFilter = typeFilter,
        _opFilter = opFilter;

  @override
  final String searchQuery;
  @override
  final double priceFilter;
  final List<String> _cityFilter;
  @override
  List<String> get cityFilter {
    if (_cityFilter is EqualUnmodifiableListView) return _cityFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cityFilter);
  }

  final List<String> _stateFilter;
  @override
  List<String> get stateFilter {
    if (_stateFilter is EqualUnmodifiableListView) return _stateFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stateFilter);
  }

  final List<String> _typeFilter;
  @override
  List<String> get typeFilter {
    if (_typeFilter is EqualUnmodifiableListView) return _typeFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeFilter);
  }

  final List<String> _opFilter;
  @override
  List<String> get opFilter {
    if (_opFilter is EqualUnmodifiableListView) return _opFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opFilter);
  }

  @override
  String toString() {
    return 'Filters(searchQuery: $searchQuery, priceFilter: $priceFilter, cityFilter: $cityFilter, stateFilter: $stateFilter, typeFilter: $typeFilter, opFilter: $opFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Filters &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.priceFilter, priceFilter) ||
                other.priceFilter == priceFilter) &&
            const DeepCollectionEquality()
                .equals(other._cityFilter, _cityFilter) &&
            const DeepCollectionEquality()
                .equals(other._stateFilter, _stateFilter) &&
            const DeepCollectionEquality()
                .equals(other._typeFilter, _typeFilter) &&
            const DeepCollectionEquality().equals(other._opFilter, _opFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      priceFilter,
      const DeepCollectionEquality().hash(_cityFilter),
      const DeepCollectionEquality().hash(_stateFilter),
      const DeepCollectionEquality().hash(_typeFilter),
      const DeepCollectionEquality().hash(_opFilter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FiltersCopyWith<_$_Filters> get copyWith =>
      __$$_FiltersCopyWithImpl<_$_Filters>(this, _$identity);
}

abstract class _Filters implements Filters {
  factory _Filters(
      {required final String searchQuery,
      required final double priceFilter,
      required final List<String> cityFilter,
      required final List<String> stateFilter,
      required final List<String> typeFilter,
      required final List<String> opFilter}) = _$_Filters;

  @override
  String get searchQuery;
  @override
  double get priceFilter;
  @override
  List<String> get cityFilter;
  @override
  List<String> get stateFilter;
  @override
  List<String> get typeFilter;
  @override
  List<String> get opFilter;
  @override
  @JsonKey(ignore: true)
  _$$_FiltersCopyWith<_$_Filters> get copyWith =>
      throw _privateConstructorUsedError;
}
