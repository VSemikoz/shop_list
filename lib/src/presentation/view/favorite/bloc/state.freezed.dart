// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteLoadingCopyWith<$Res> {
  factory _$$FavoriteLoadingCopyWith(
          _$FavoriteLoading value, $Res Function(_$FavoriteLoading) then) =
      __$$FavoriteLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteLoadingCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteLoading>
    implements _$$FavoriteLoadingCopyWith<$Res> {
  __$$FavoriteLoadingCopyWithImpl(
      _$FavoriteLoading _value, $Res Function(_$FavoriteLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoriteLoading implements FavoriteLoading {
  const _$FavoriteLoading();

  @override
  String toString() {
    return 'FavoriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteLoading implements FavoriteState {
  const factory FavoriteLoading() = _$FavoriteLoading;
}

/// @nodoc
abstract class _$$FavoriteSuccessCopyWith<$Res> {
  factory _$$FavoriteSuccessCopyWith(
          _$FavoriteSuccess value, $Res Function(_$FavoriteSuccess) then) =
      __$$FavoriteSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ProductEntry> saveProducts,
      List<ProductEntry> needProducts,
      List<ProductEntry> readyProducts});
}

/// @nodoc
class __$$FavoriteSuccessCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteSuccess>
    implements _$$FavoriteSuccessCopyWith<$Res> {
  __$$FavoriteSuccessCopyWithImpl(
      _$FavoriteSuccess _value, $Res Function(_$FavoriteSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saveProducts = null,
    Object? needProducts = null,
    Object? readyProducts = null,
  }) {
    return _then(_$FavoriteSuccess(
      saveProducts: null == saveProducts
          ? _value._saveProducts
          : saveProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntry>,
      needProducts: null == needProducts
          ? _value._needProducts
          : needProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntry>,
      readyProducts: null == readyProducts
          ? _value._readyProducts
          : readyProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntry>,
    ));
  }
}

/// @nodoc

class _$FavoriteSuccess implements FavoriteSuccess {
  const _$FavoriteSuccess(
      {required final List<ProductEntry> saveProducts,
      required final List<ProductEntry> needProducts,
      required final List<ProductEntry> readyProducts})
      : _saveProducts = saveProducts,
        _needProducts = needProducts,
        _readyProducts = readyProducts;

  final List<ProductEntry> _saveProducts;
  @override
  List<ProductEntry> get saveProducts {
    if (_saveProducts is EqualUnmodifiableListView) return _saveProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saveProducts);
  }

  final List<ProductEntry> _needProducts;
  @override
  List<ProductEntry> get needProducts {
    if (_needProducts is EqualUnmodifiableListView) return _needProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_needProducts);
  }

  final List<ProductEntry> _readyProducts;
  @override
  List<ProductEntry> get readyProducts {
    if (_readyProducts is EqualUnmodifiableListView) return _readyProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readyProducts);
  }

  @override
  String toString() {
    return 'FavoriteState.success(saveProducts: $saveProducts, needProducts: $needProducts, readyProducts: $readyProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSuccess &&
            const DeepCollectionEquality()
                .equals(other._saveProducts, _saveProducts) &&
            const DeepCollectionEquality()
                .equals(other._needProducts, _needProducts) &&
            const DeepCollectionEquality()
                .equals(other._readyProducts, _readyProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_saveProducts),
      const DeepCollectionEquality().hash(_needProducts),
      const DeepCollectionEquality().hash(_readyProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSuccessCopyWith<_$FavoriteSuccess> get copyWith =>
      __$$FavoriteSuccessCopyWithImpl<_$FavoriteSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) {
    return success(saveProducts, needProducts, readyProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) {
    return success?.call(saveProducts, needProducts, readyProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(saveProducts, needProducts, readyProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteLoading value) loading,
    required TResult Function(FavoriteSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteLoading value)? loading,
    TResult? Function(FavoriteSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteLoading value)? loading,
    TResult Function(FavoriteSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FavoriteSuccess implements FavoriteState {
  const factory FavoriteSuccess(
      {required final List<ProductEntry> saveProducts,
      required final List<ProductEntry> needProducts,
      required final List<ProductEntry> readyProducts}) = _$FavoriteSuccess;

  List<ProductEntry> get saveProducts;
  List<ProductEntry> get needProducts;
  List<ProductEntry> get readyProducts;
  @JsonKey(ignore: true)
  _$$FavoriteSuccessCopyWith<_$FavoriteSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
