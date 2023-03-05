// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterValuesModel _$FilterValuesModelFromJson(Map<String, dynamic> json) {
  return _FilterValuesModel.fromJson(json);
}

/// @nodoc
mixin _$FilterValuesModel {
  List<String> get cities => throw _privateConstructorUsedError;
  List<String> get states => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterValuesModelCopyWith<FilterValuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterValuesModelCopyWith<$Res> {
  factory $FilterValuesModelCopyWith(
          FilterValuesModel value, $Res Function(FilterValuesModel) then) =
      _$FilterValuesModelCopyWithImpl<$Res, FilterValuesModel>;
  @useResult
  $Res call({List<String> cities, List<String> states, int maxPrice});
}

/// @nodoc
class _$FilterValuesModelCopyWithImpl<$Res, $Val extends FilterValuesModel>
    implements $FilterValuesModelCopyWith<$Res> {
  _$FilterValuesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? states = null,
    Object? maxPrice = null,
  }) {
    return _then(_value.copyWith(
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      states: null == states
          ? _value.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterValuesModelCopyWith<$Res>
    implements $FilterValuesModelCopyWith<$Res> {
  factory _$$_FilterValuesModelCopyWith(_$_FilterValuesModel value,
          $Res Function(_$_FilterValuesModel) then) =
      __$$_FilterValuesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> cities, List<String> states, int maxPrice});
}

/// @nodoc
class __$$_FilterValuesModelCopyWithImpl<$Res>
    extends _$FilterValuesModelCopyWithImpl<$Res, _$_FilterValuesModel>
    implements _$$_FilterValuesModelCopyWith<$Res> {
  __$$_FilterValuesModelCopyWithImpl(
      _$_FilterValuesModel _value, $Res Function(_$_FilterValuesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? states = null,
    Object? maxPrice = null,
  }) {
    return _then(_$_FilterValuesModel(
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      states: null == states
          ? _value._states
          : states // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilterValuesModel implements _FilterValuesModel {
  const _$_FilterValuesModel(
      {required final List<String> cities,
      required final List<String> states,
      required this.maxPrice})
      : _cities = cities,
        _states = states;

  factory _$_FilterValuesModel.fromJson(Map<String, dynamic> json) =>
      _$$_FilterValuesModelFromJson(json);

  final List<String> _cities;
  @override
  List<String> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  final List<String> _states;
  @override
  List<String> get states {
    if (_states is EqualUnmodifiableListView) return _states;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_states);
  }

  @override
  final int maxPrice;

  @override
  String toString() {
    return 'FilterValuesModel(cities: $cities, states: $states, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterValuesModel &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._states, _states) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_states),
      maxPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterValuesModelCopyWith<_$_FilterValuesModel> get copyWith =>
      __$$_FilterValuesModelCopyWithImpl<_$_FilterValuesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterValuesModelToJson(
      this,
    );
  }
}

abstract class _FilterValuesModel implements FilterValuesModel {
  const factory _FilterValuesModel(
      {required final List<String> cities,
      required final List<String> states,
      required final int maxPrice}) = _$_FilterValuesModel;

  factory _FilterValuesModel.fromJson(Map<String, dynamic> json) =
      _$_FilterValuesModel.fromJson;

  @override
  List<String> get cities;
  @override
  List<String> get states;
  @override
  int get maxPrice;
  @override
  @JsonKey(ignore: true)
  _$$_FilterValuesModelCopyWith<_$_FilterValuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
