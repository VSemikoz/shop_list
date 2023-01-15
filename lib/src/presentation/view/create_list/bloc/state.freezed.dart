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
mixin _$CreateListState {
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
    required TResult Function(CreateListLoading value) loading,
    required TResult Function(CreateListSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateListLoading value)? loading,
    TResult? Function(CreateListSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateListLoading value)? loading,
    TResult Function(CreateListSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateListStateCopyWith<$Res> {
  factory $CreateListStateCopyWith(
          CreateListState value, $Res Function(CreateListState) then) =
      _$CreateListStateCopyWithImpl<$Res, CreateListState>;
}

/// @nodoc
class _$CreateListStateCopyWithImpl<$Res, $Val extends CreateListState>
    implements $CreateListStateCopyWith<$Res> {
  _$CreateListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateListLoadingCopyWith<$Res> {
  factory _$$CreateListLoadingCopyWith(
          _$CreateListLoading value, $Res Function(_$CreateListLoading) then) =
      __$$CreateListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateListLoadingCopyWithImpl<$Res>
    extends _$CreateListStateCopyWithImpl<$Res, _$CreateListLoading>
    implements _$$CreateListLoadingCopyWith<$Res> {
  __$$CreateListLoadingCopyWithImpl(
      _$CreateListLoading _value, $Res Function(_$CreateListLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateListLoading implements CreateListLoading {
  const _$CreateListLoading();

  @override
  String toString() {
    return 'CreateListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateListLoading);
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
    required TResult Function(CreateListLoading value) loading,
    required TResult Function(CreateListSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateListLoading value)? loading,
    TResult? Function(CreateListSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateListLoading value)? loading,
    TResult Function(CreateListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreateListLoading implements CreateListState {
  const factory CreateListLoading() = _$CreateListLoading;
}

/// @nodoc
abstract class _$$CreateListSuccessCopyWith<$Res> {
  factory _$$CreateListSuccessCopyWith(
          _$CreateListSuccess value, $Res Function(_$CreateListSuccess) then) =
      __$$CreateListSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class __$$CreateListSuccessCopyWithImpl<$Res>
    extends _$CreateListStateCopyWithImpl<$Res, _$CreateListSuccess>
    implements _$$CreateListSuccessCopyWith<$Res> {
  __$$CreateListSuccessCopyWithImpl(
      _$CreateListSuccess _value, $Res Function(_$CreateListSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$CreateListSuccess(
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

class _$CreateListSuccess implements CreateListSuccess {
  const _$CreateListSuccess({required this.name, required this.color});

  @override
  final String name;
  @override
  final Color color;

  @override
  String toString() {
    return 'CreateListState.success(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateListSuccess &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateListSuccessCopyWith<_$CreateListSuccess> get copyWith =>
      __$$CreateListSuccessCopyWithImpl<_$CreateListSuccess>(this, _$identity);

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
    required TResult Function(CreateListLoading value) loading,
    required TResult Function(CreateListSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateListLoading value)? loading,
    TResult? Function(CreateListSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateListLoading value)? loading,
    TResult Function(CreateListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CreateListSuccess implements CreateListState {
  const factory CreateListSuccess(
      {required final String name,
      required final Color color}) = _$CreateListSuccess;

  String get name;
  Color get color;
  @JsonKey(ignore: true)
  _$$CreateListSuccessCopyWith<_$CreateListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
