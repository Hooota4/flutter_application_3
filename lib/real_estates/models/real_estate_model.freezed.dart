// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_estate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RealEstateModel _$RealEstateModelFromJson(Map<String, dynamic> json) {
  return _RealEstateModel.fromJson(json);
}

/// @nodoc
mixin _$RealEstateModel {
  int get id => throw _privateConstructorUsedError;
  User? get advertiser => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get nationalID => throw _privateConstructorUsedError;
  String get facilitiesNum => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get approval => throw _privateConstructorUsedError;
  List<ImageModel>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealEstateModelCopyWith<RealEstateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealEstateModelCopyWith<$Res> {
  factory $RealEstateModelCopyWith(
          RealEstateModel value, $Res Function(RealEstateModel) then) =
      _$RealEstateModelCopyWithImpl<$Res, RealEstateModel>;
  @useResult
  $Res call(
      {int id,
      User? advertiser,
      String title,
      String description,
      String nationalID,
      String facilitiesNum,
      String type,
      String operation,
      String state,
      String city,
      String location,
      String price,
      String approval,
      List<ImageModel>? images});

  $UserCopyWith<$Res>? get advertiser;
}

/// @nodoc
class _$RealEstateModelCopyWithImpl<$Res, $Val extends RealEstateModel>
    implements $RealEstateModelCopyWith<$Res> {
  _$RealEstateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? advertiser = freezed,
    Object? title = null,
    Object? description = null,
    Object? nationalID = null,
    Object? facilitiesNum = null,
    Object? type = null,
    Object? operation = null,
    Object? state = null,
    Object? city = null,
    Object? location = null,
    Object? price = null,
    Object? approval = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      advertiser: freezed == advertiser
          ? _value.advertiser
          : advertiser // ignore: cast_nullable_to_non_nullable
              as User?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nationalID: null == nationalID
          ? _value.nationalID
          : nationalID // ignore: cast_nullable_to_non_nullable
              as String,
      facilitiesNum: null == facilitiesNum
          ? _value.facilitiesNum
          : facilitiesNum // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      approval: null == approval
          ? _value.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get advertiser {
    if (_value.advertiser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.advertiser!, (value) {
      return _then(_value.copyWith(advertiser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RealEstateModelCopyWith<$Res>
    implements $RealEstateModelCopyWith<$Res> {
  factory _$$_RealEstateModelCopyWith(
          _$_RealEstateModel value, $Res Function(_$_RealEstateModel) then) =
      __$$_RealEstateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      User? advertiser,
      String title,
      String description,
      String nationalID,
      String facilitiesNum,
      String type,
      String operation,
      String state,
      String city,
      String location,
      String price,
      String approval,
      List<ImageModel>? images});

  @override
  $UserCopyWith<$Res>? get advertiser;
}

/// @nodoc
class __$$_RealEstateModelCopyWithImpl<$Res>
    extends _$RealEstateModelCopyWithImpl<$Res, _$_RealEstateModel>
    implements _$$_RealEstateModelCopyWith<$Res> {
  __$$_RealEstateModelCopyWithImpl(
      _$_RealEstateModel _value, $Res Function(_$_RealEstateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? advertiser = freezed,
    Object? title = null,
    Object? description = null,
    Object? nationalID = null,
    Object? facilitiesNum = null,
    Object? type = null,
    Object? operation = null,
    Object? state = null,
    Object? city = null,
    Object? location = null,
    Object? price = null,
    Object? approval = null,
    Object? images = freezed,
  }) {
    return _then(_$_RealEstateModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      advertiser: freezed == advertiser
          ? _value.advertiser
          : advertiser // ignore: cast_nullable_to_non_nullable
              as User?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      nationalID: null == nationalID
          ? _value.nationalID
          : nationalID // ignore: cast_nullable_to_non_nullable
              as String,
      facilitiesNum: null == facilitiesNum
          ? _value.facilitiesNum
          : facilitiesNum // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      approval: null == approval
          ? _value.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RealEstateModel implements _RealEstateModel {
  const _$_RealEstateModel(
      {required this.id,
      this.advertiser,
      required this.title,
      required this.description,
      required this.nationalID,
      required this.facilitiesNum,
      required this.type,
      required this.operation,
      required this.state,
      required this.city,
      required this.location,
      required this.price,
      required this.approval,
      final List<ImageModel>? images})
      : _images = images;

  factory _$_RealEstateModel.fromJson(Map<String, dynamic> json) =>
      _$$_RealEstateModelFromJson(json);

  @override
  final int id;
  @override
  final User? advertiser;
  @override
  final String title;
  @override
  final String description;
  @override
  final String nationalID;
  @override
  final String facilitiesNum;
  @override
  final String type;
  @override
  final String operation;
  @override
  final String state;
  @override
  final String city;
  @override
  final String location;
  @override
  final String price;
  @override
  final String approval;
  final List<ImageModel>? _images;
  @override
  List<ImageModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RealEstateModel(id: $id, advertiser: $advertiser, title: $title, description: $description, nationalID: $nationalID, facilitiesNum: $facilitiesNum, type: $type, operation: $operation, state: $state, city: $city, location: $location, price: $price, approval: $approval, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RealEstateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.advertiser, advertiser) ||
                other.advertiser == advertiser) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.nationalID, nationalID) ||
                other.nationalID == nationalID) &&
            (identical(other.facilitiesNum, facilitiesNum) ||
                other.facilitiesNum == facilitiesNum) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.approval, approval) ||
                other.approval == approval) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      advertiser,
      title,
      description,
      nationalID,
      facilitiesNum,
      type,
      operation,
      state,
      city,
      location,
      price,
      approval,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RealEstateModelCopyWith<_$_RealEstateModel> get copyWith =>
      __$$_RealEstateModelCopyWithImpl<_$_RealEstateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RealEstateModelToJson(
      this,
    );
  }
}

abstract class _RealEstateModel implements RealEstateModel {
  const factory _RealEstateModel(
      {required final int id,
      final User? advertiser,
      required final String title,
      required final String description,
      required final String nationalID,
      required final String facilitiesNum,
      required final String type,
      required final String operation,
      required final String state,
      required final String city,
      required final String location,
      required final String price,
      required final String approval,
      final List<ImageModel>? images}) = _$_RealEstateModel;

  factory _RealEstateModel.fromJson(Map<String, dynamic> json) =
      _$_RealEstateModel.fromJson;

  @override
  int get id;
  @override
  User? get advertiser;
  @override
  String get title;
  @override
  String get description;
  @override
  String get nationalID;
  @override
  String get facilitiesNum;
  @override
  String get type;
  @override
  String get operation;
  @override
  String get state;
  @override
  String get city;
  @override
  String get location;
  @override
  String get price;
  @override
  String get approval;
  @override
  List<ImageModel>? get images;
  @override
  @JsonKey(ignore: true)
  _$$_RealEstateModelCopyWith<_$_RealEstateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
