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
mixin _$ListDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ListEntry list, List<ProductEntry> products)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ListEntry list, List<ProductEntry> products)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListEntry list, List<ProductEntry> products)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListDetailsLoading value) loading,
    required TResult Function(ListDetailsSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListDetailsLoading value)? loading,
    TResult? Function(ListDetailsSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListDetailsLoading value)? loading,
    TResult Function(ListDetailsSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDetailsStateCopyWith<$Res> {
  factory $ListDetailsStateCopyWith(
          ListDetailsState value, $Res Function(ListDetailsState) then) =
      _$ListDetailsStateCopyWithImpl<$Res, ListDetailsState>;
}

/// @nodoc
class _$ListDetailsStateCopyWithImpl<$Res, $Val extends ListDetailsState>
    implements $ListDetailsStateCopyWith<$Res> {
  _$ListDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ListDetailsLoadingCopyWith<$Res> {
  factory _$$ListDetailsLoadingCopyWith(_$ListDetailsLoading value,
          $Res Function(_$ListDetailsLoading) then) =
      __$$ListDetailsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListDetailsLoadingCopyWithImpl<$Res>
    extends _$ListDetailsStateCopyWithImpl<$Res, _$ListDetailsLoading>
    implements _$$ListDetailsLoadingCopyWith<$Res> {
  __$$ListDetailsLoadingCopyWithImpl(
      _$ListDetailsLoading _value, $Res Function(_$ListDetailsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ListDetailsLoading implements ListDetailsLoading {
  const _$ListDetailsLoading();

  @override
  String toString() {
    return 'ListDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ListEntry list, List<ProductEntry> products)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ListEntry list, List<ProductEntry> products)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListEntry list, List<ProductEntry> products)? success,
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
    required TResult Function(ListDetailsLoading value) loading,
    required TResult Function(ListDetailsSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListDetailsLoading value)? loading,
    TResult? Function(ListDetailsSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListDetailsLoading value)? loading,
    TResult Function(ListDetailsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListDetailsLoading implements ListDetailsState {
  const factory ListDetailsLoading() = _$ListDetailsLoading;
}

/// @nodoc
abstract class _$$ListDetailsSuccessCopyWith<$Res> {
  factory _$$ListDetailsSuccessCopyWith(_$ListDetailsSuccess value,
          $Res Function(_$ListDetailsSuccess) then) =
      __$$ListDetailsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ListEntry list, List<ProductEntry> products});
}

/// @nodoc
class __$$ListDetailsSuccessCopyWithImpl<$Res>
    extends _$ListDetailsStateCopyWithImpl<$Res, _$ListDetailsSuccess>
    implements _$$ListDetailsSuccessCopyWith<$Res> {
  __$$ListDetailsSuccessCopyWithImpl(
      _$ListDetailsSuccess _value, $Res Function(_$ListDetailsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? products = null,
  }) {
    return _then(_$ListDetailsSuccess(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListEntry,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntry>,
    ));
  }
}

/// @nodoc

class _$ListDetailsSuccess implements ListDetailsSuccess {
  const _$ListDetailsSuccess(
      {required this.list, required final List<ProductEntry> products})
      : _products = products;

  @override
  final ListEntry list;
  final List<ProductEntry> _products;
  @override
  List<ProductEntry> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ListDetailsState.success(list: $list, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDetailsSuccess &&
            (identical(other.list, list) || other.list == list) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, list, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDetailsSuccessCopyWith<_$ListDetailsSuccess> get copyWith =>
      __$$ListDetailsSuccessCopyWithImpl<_$ListDetailsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ListEntry list, List<ProductEntry> products)
        success,
  }) {
    return success(list, products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ListEntry list, List<ProductEntry> products)? success,
  }) {
    return success?.call(list, products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ListEntry list, List<ProductEntry> products)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListDetailsLoading value) loading,
    required TResult Function(ListDetailsSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListDetailsLoading value)? loading,
    TResult? Function(ListDetailsSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListDetailsLoading value)? loading,
    TResult Function(ListDetailsSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ListDetailsSuccess implements ListDetailsState {
  const factory ListDetailsSuccess(
      {required final ListEntry list,
      required final List<ProductEntry> products}) = _$ListDetailsSuccess;

  ListEntry get list;
  List<ProductEntry> get products;
  @JsonKey(ignore: true)
  _$$ListDetailsSuccessCopyWith<_$ListDetailsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
