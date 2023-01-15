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
mixin _$CategoriesListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CategoryEntry> categories) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntry> categories)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CategoryEntry> categories)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListLoading value) loading,
    required TResult Function(CategoriesListSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListLoading value)? loading,
    TResult? Function(CategoriesListSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListLoading value)? loading,
    TResult Function(CategoriesListSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesListStateCopyWith<$Res> {
  factory $CategoriesListStateCopyWith(
          CategoriesListState value, $Res Function(CategoriesListState) then) =
      _$CategoriesListStateCopyWithImpl<$Res, CategoriesListState>;
}

/// @nodoc
class _$CategoriesListStateCopyWithImpl<$Res, $Val extends CategoriesListState>
    implements $CategoriesListStateCopyWith<$Res> {
  _$CategoriesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoriesListLoadingCopyWith<$Res> {
  factory _$$CategoriesListLoadingCopyWith(_$CategoriesListLoading value,
          $Res Function(_$CategoriesListLoading) then) =
      __$$CategoriesListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesListLoadingCopyWithImpl<$Res>
    extends _$CategoriesListStateCopyWithImpl<$Res, _$CategoriesListLoading>
    implements _$$CategoriesListLoadingCopyWith<$Res> {
  __$$CategoriesListLoadingCopyWithImpl(_$CategoriesListLoading _value,
      $Res Function(_$CategoriesListLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoriesListLoading implements CategoriesListLoading {
  const _$CategoriesListLoading();

  @override
  String toString() {
    return 'CategoriesListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CategoryEntry> categories) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntry> categories)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CategoryEntry> categories)? success,
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
    required TResult Function(CategoriesListLoading value) loading,
    required TResult Function(CategoriesListSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListLoading value)? loading,
    TResult? Function(CategoriesListSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListLoading value)? loading,
    TResult Function(CategoriesListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoriesListLoading implements CategoriesListState {
  const factory CategoriesListLoading() = _$CategoriesListLoading;
}

/// @nodoc
abstract class _$$CategoriesListSuccessCopyWith<$Res> {
  factory _$$CategoriesListSuccessCopyWith(_$CategoriesListSuccess value,
          $Res Function(_$CategoriesListSuccess) then) =
      __$$CategoriesListSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryEntry> categories});
}

/// @nodoc
class __$$CategoriesListSuccessCopyWithImpl<$Res>
    extends _$CategoriesListStateCopyWithImpl<$Res, _$CategoriesListSuccess>
    implements _$$CategoriesListSuccessCopyWith<$Res> {
  __$$CategoriesListSuccessCopyWithImpl(_$CategoriesListSuccess _value,
      $Res Function(_$CategoriesListSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoriesListSuccess(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntry>,
    ));
  }
}

/// @nodoc

class _$CategoriesListSuccess implements CategoriesListSuccess {
  const _$CategoriesListSuccess({required final List<CategoryEntry> categories})
      : _categories = categories;

  final List<CategoryEntry> _categories;
  @override
  List<CategoryEntry> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoriesListState.success(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesListSuccess &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesListSuccessCopyWith<_$CategoriesListSuccess> get copyWith =>
      __$$CategoriesListSuccessCopyWithImpl<_$CategoriesListSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CategoryEntry> categories) success,
  }) {
    return success(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CategoryEntry> categories)? success,
  }) {
    return success?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CategoryEntry> categories)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListLoading value) loading,
    required TResult Function(CategoriesListSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListLoading value)? loading,
    TResult? Function(CategoriesListSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListLoading value)? loading,
    TResult Function(CategoriesListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CategoriesListSuccess implements CategoriesListState {
  const factory CategoriesListSuccess(
          {required final List<CategoryEntry> categories}) =
      _$CategoriesListSuccess;

  List<CategoryEntry> get categories;
  @JsonKey(ignore: true)
  _$$CategoriesListSuccessCopyWith<_$CategoriesListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
