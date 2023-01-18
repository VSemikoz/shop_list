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
mixin _$EditListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String name, Color color) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String name, Color color)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String name, Color color)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditListLoading value) loading,
    required TResult Function(EditListSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListLoading value)? loading,
    TResult? Function(EditListSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListLoading value)? loading,
    TResult Function(EditListSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditListStateCopyWith<$Res> {
  factory $EditListStateCopyWith(
          EditListState value, $Res Function(EditListState) then) =
      _$EditListStateCopyWithImpl<$Res, EditListState>;
}

/// @nodoc
class _$EditListStateCopyWithImpl<$Res, $Val extends EditListState>
    implements $EditListStateCopyWith<$Res> {
  _$EditListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditListLoadingCopyWith<$Res> {
  factory _$$EditListLoadingCopyWith(
          _$EditListLoading value, $Res Function(_$EditListLoading) then) =
      __$$EditListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditListLoadingCopyWithImpl<$Res>
    extends _$EditListStateCopyWithImpl<$Res, _$EditListLoading>
    implements _$$EditListLoadingCopyWith<$Res> {
  __$$EditListLoadingCopyWithImpl(
      _$EditListLoading _value, $Res Function(_$EditListLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditListLoading implements EditListLoading {
  const _$EditListLoading();

  @override
  String toString() {
    return 'EditListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String name, Color color) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String name, Color color)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String name, Color color)? success,
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
    required TResult Function(EditListLoading value) loading,
    required TResult Function(EditListSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListLoading value)? loading,
    TResult? Function(EditListSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListLoading value)? loading,
    TResult Function(EditListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditListLoading implements EditListState {
  const factory EditListLoading() = _$EditListLoading;
}

/// @nodoc
abstract class _$$EditListSuccessCopyWith<$Res> {
  factory _$$EditListSuccessCopyWith(
          _$EditListSuccess value, $Res Function(_$EditListSuccess) then) =
      __$$EditListSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class __$$EditListSuccessCopyWithImpl<$Res>
    extends _$EditListStateCopyWithImpl<$Res, _$EditListSuccess>
    implements _$$EditListSuccessCopyWith<$Res> {
  __$$EditListSuccessCopyWithImpl(
      _$EditListSuccess _value, $Res Function(_$EditListSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$EditListSuccess(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$EditListSuccess implements EditListSuccess {
  const _$EditListSuccess({required this.name, required this.color});

  @override
  final String name;
  @override
  final Color color;

  @override
  String toString() {
    return 'EditListState.success(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditListSuccess &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditListSuccessCopyWith<_$EditListSuccess> get copyWith =>
      __$$EditListSuccessCopyWithImpl<_$EditListSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String name, Color color) success,
  }) {
    return success(name, color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String name, Color color)? success,
  }) {
    return success?.call(name, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String name, Color color)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(name, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditListLoading value) loading,
    required TResult Function(EditListSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListLoading value)? loading,
    TResult? Function(EditListSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListLoading value)? loading,
    TResult Function(EditListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class EditListSuccess implements EditListState {
  const factory EditListSuccess(
      {required final String name,
      required final Color color}) = _$EditListSuccess;

  String get name;
  Color get color;
  @JsonKey(ignore: true)
  _$$EditListSuccessCopyWith<_$EditListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
