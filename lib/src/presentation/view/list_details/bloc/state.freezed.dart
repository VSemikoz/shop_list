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
  ListEntry get list => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListEntry list) loading,
    required TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListEntry list)? loading,
    TResult? Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListEntry list)? loading,
    TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
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

  @JsonKey(ignore: true)
  $ListDetailsStateCopyWith<ListDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDetailsStateCopyWith<$Res> {
  factory $ListDetailsStateCopyWith(
          ListDetailsState value, $Res Function(ListDetailsState) then) =
      _$ListDetailsStateCopyWithImpl<$Res, ListDetailsState>;
  @useResult
  $Res call({ListEntry list});
}

/// @nodoc
class _$ListDetailsStateCopyWithImpl<$Res, $Val extends ListDetailsState>
    implements $ListDetailsStateCopyWith<$Res> {
  _$ListDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListEntry,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListDetailsLoadingCopyWith<$Res>
    implements $ListDetailsStateCopyWith<$Res> {
  factory _$$ListDetailsLoadingCopyWith(_$ListDetailsLoading value,
          $Res Function(_$ListDetailsLoading) then) =
      __$$ListDetailsLoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ListEntry list});
}

/// @nodoc
class __$$ListDetailsLoadingCopyWithImpl<$Res>
    extends _$ListDetailsStateCopyWithImpl<$Res, _$ListDetailsLoading>
    implements _$$ListDetailsLoadingCopyWith<$Res> {
  __$$ListDetailsLoadingCopyWithImpl(
      _$ListDetailsLoading _value, $Res Function(_$ListDetailsLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$ListDetailsLoading(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListEntry,
    ));
  }
}

/// @nodoc

class _$ListDetailsLoading implements ListDetailsLoading {
  const _$ListDetailsLoading({required this.list});

  @override
  final ListEntry list;

  @override
  String toString() {
    return 'ListDetailsState.loading(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDetailsLoading &&
            (identical(other.list, list) || other.list == list));
  }

  @override
  int get hashCode => Object.hash(runtimeType, list);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDetailsLoadingCopyWith<_$ListDetailsLoading> get copyWith =>
      __$$ListDetailsLoadingCopyWithImpl<_$ListDetailsLoading>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListEntry list) loading,
    required TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) {
    return loading(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListEntry list)? loading,
    TResult? Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) {
    return loading?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListEntry list)? loading,
    TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(list);
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
  const factory ListDetailsLoading({required final ListEntry list}) =
      _$ListDetailsLoading;

  @override
  ListEntry get list;
  @override
  @JsonKey(ignore: true)
  _$$ListDetailsLoadingCopyWith<_$ListDetailsLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListDetailsSuccessCopyWith<$Res>
    implements $ListDetailsStateCopyWith<$Res> {
  factory _$$ListDetailsSuccessCopyWith(_$ListDetailsSuccess value,
          $Res Function(_$ListDetailsSuccess) then) =
      __$$ListDetailsSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ListEntry list,
      List<ProductEntry> saveProducts,
      List<ProductEntry> needProducts,
      List<ProductEntry> readyProducts});
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
    Object? saveProducts = null,
    Object? needProducts = null,
    Object? readyProducts = null,
  }) {
    return _then(_$ListDetailsSuccess(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListEntry,
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

class _$ListDetailsSuccess implements ListDetailsSuccess {
  const _$ListDetailsSuccess(
      {required this.list,
      required final List<ProductEntry> saveProducts,
      required final List<ProductEntry> needProducts,
      required final List<ProductEntry> readyProducts})
      : _saveProducts = saveProducts,
        _needProducts = needProducts,
        _readyProducts = readyProducts;

  @override
  final ListEntry list;
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
    return 'ListDetailsState.success(list: $list, saveProducts: $saveProducts, needProducts: $needProducts, readyProducts: $readyProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDetailsSuccess &&
            (identical(other.list, list) || other.list == list) &&
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
      list,
      const DeepCollectionEquality().hash(_saveProducts),
      const DeepCollectionEquality().hash(_needProducts),
      const DeepCollectionEquality().hash(_readyProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDetailsSuccessCopyWith<_$ListDetailsSuccess> get copyWith =>
      __$$ListDetailsSuccessCopyWithImpl<_$ListDetailsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListEntry list) loading,
    required TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)
        success,
  }) {
    return success(list, saveProducts, needProducts, readyProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListEntry list)? loading,
    TResult? Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
  }) {
    return success?.call(list, saveProducts, needProducts, readyProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListEntry list)? loading,
    TResult Function(ListEntry list, List<ProductEntry> saveProducts,
            List<ProductEntry> needProducts, List<ProductEntry> readyProducts)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, saveProducts, needProducts, readyProducts);
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
      required final List<ProductEntry> saveProducts,
      required final List<ProductEntry> needProducts,
      required final List<ProductEntry> readyProducts}) = _$ListDetailsSuccess;

  @override
  ListEntry get list;
  List<ProductEntry> get saveProducts;
  List<ProductEntry> get needProducts;
  List<ProductEntry> get readyProducts;
  @override
  @JsonKey(ignore: true)
  _$$ListDetailsSuccessCopyWith<_$ListDetailsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
