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
mixin _$EditProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntry product) initial,
    required TResult Function() loading,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductEntry product)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntry product)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProductInitial value) initial,
    required TResult Function(EditProductLoading value) loading,
    required TResult Function(EditProductSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditProductInitial value)? initial,
    TResult? Function(EditProductLoading value)? loading,
    TResult? Function(EditProductSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProductInitial value)? initial,
    TResult Function(EditProductLoading value)? loading,
    TResult Function(EditProductSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProductStateCopyWith<$Res> {
  factory $EditProductStateCopyWith(
          EditProductState value, $Res Function(EditProductState) then) =
      _$EditProductStateCopyWithImpl<$Res, EditProductState>;
}

/// @nodoc
class _$EditProductStateCopyWithImpl<$Res, $Val extends EditProductState>
    implements $EditProductStateCopyWith<$Res> {
  _$EditProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditProductInitialCopyWith<$Res> {
  factory _$$EditProductInitialCopyWith(_$EditProductInitial value,
          $Res Function(_$EditProductInitial) then) =
      __$$EditProductInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductEntry product});
}

/// @nodoc
class __$$EditProductInitialCopyWithImpl<$Res>
    extends _$EditProductStateCopyWithImpl<$Res, _$EditProductInitial>
    implements _$$EditProductInitialCopyWith<$Res> {
  __$$EditProductInitialCopyWithImpl(
      _$EditProductInitial _value, $Res Function(_$EditProductInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$EditProductInitial(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntry,
    ));
  }
}

/// @nodoc

class _$EditProductInitial implements EditProductInitial {
  const _$EditProductInitial(this.product);

  @override
  final ProductEntry product;

  @override
  String toString() {
    return 'EditProductState.initial(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProductInitial &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProductInitialCopyWith<_$EditProductInitial> get copyWith =>
      __$$EditProductInitialCopyWithImpl<_$EditProductInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntry product) initial,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return initial(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductEntry product)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return initial?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntry product)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProductInitial value) initial,
    required TResult Function(EditProductLoading value) loading,
    required TResult Function(EditProductSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditProductInitial value)? initial,
    TResult? Function(EditProductLoading value)? loading,
    TResult? Function(EditProductSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProductInitial value)? initial,
    TResult Function(EditProductLoading value)? loading,
    TResult Function(EditProductSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EditProductInitial implements EditProductState {
  const factory EditProductInitial(final ProductEntry product) =
      _$EditProductInitial;

  ProductEntry get product;
  @JsonKey(ignore: true)
  _$$EditProductInitialCopyWith<_$EditProductInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditProductLoadingCopyWith<$Res> {
  factory _$$EditProductLoadingCopyWith(_$EditProductLoading value,
          $Res Function(_$EditProductLoading) then) =
      __$$EditProductLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditProductLoadingCopyWithImpl<$Res>
    extends _$EditProductStateCopyWithImpl<$Res, _$EditProductLoading>
    implements _$$EditProductLoadingCopyWith<$Res> {
  __$$EditProductLoadingCopyWithImpl(
      _$EditProductLoading _value, $Res Function(_$EditProductLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditProductLoading implements EditProductLoading {
  const _$EditProductLoading();

  @override
  String toString() {
    return 'EditProductState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditProductLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntry product) initial,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductEntry product)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntry product)? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(EditProductInitial value) initial,
    required TResult Function(EditProductLoading value) loading,
    required TResult Function(EditProductSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditProductInitial value)? initial,
    TResult? Function(EditProductLoading value)? loading,
    TResult? Function(EditProductSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProductInitial value)? initial,
    TResult Function(EditProductLoading value)? loading,
    TResult Function(EditProductSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditProductLoading implements EditProductState {
  const factory EditProductLoading() = _$EditProductLoading;
}

/// @nodoc
abstract class _$$EditProductSuccessCopyWith<$Res> {
  factory _$$EditProductSuccessCopyWith(_$EditProductSuccess value,
          $Res Function(_$EditProductSuccess) then) =
      __$$EditProductSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditProductSuccessCopyWithImpl<$Res>
    extends _$EditProductStateCopyWithImpl<$Res, _$EditProductSuccess>
    implements _$$EditProductSuccessCopyWith<$Res> {
  __$$EditProductSuccessCopyWithImpl(
      _$EditProductSuccess _value, $Res Function(_$EditProductSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditProductSuccess implements EditProductSuccess {
  const _$EditProductSuccess();

  @override
  String toString() {
    return 'EditProductState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditProductSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntry product) initial,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductEntry product)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntry product)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProductInitial value) initial,
    required TResult Function(EditProductLoading value) loading,
    required TResult Function(EditProductSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditProductInitial value)? initial,
    TResult? Function(EditProductLoading value)? loading,
    TResult? Function(EditProductSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProductInitial value)? initial,
    TResult Function(EditProductLoading value)? loading,
    TResult Function(EditProductSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class EditProductSuccess implements EditProductState {
  const factory EditProductSuccess() = _$EditProductSuccess;
}
