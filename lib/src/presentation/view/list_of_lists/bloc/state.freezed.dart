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
mixin _$ListOfListsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListViewVariant variant, List<ListEntry> lists)
        success,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListOfListsSuccess value) success,
    required TResult Function(ListOfListsLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListOfListsSuccess value)? success,
    TResult? Function(ListOfListsLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListOfListsSuccess value)? success,
    TResult Function(ListOfListsLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfListsStateCopyWith<$Res> {
  factory $ListOfListsStateCopyWith(
          ListOfListsState value, $Res Function(ListOfListsState) then) =
      _$ListOfListsStateCopyWithImpl<$Res, ListOfListsState>;
}

/// @nodoc
class _$ListOfListsStateCopyWithImpl<$Res, $Val extends ListOfListsState>
    implements $ListOfListsStateCopyWith<$Res> {
  _$ListOfListsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ListOfListsSuccessCopyWith<$Res> {
  factory _$$ListOfListsSuccessCopyWith(_$ListOfListsSuccess value,
          $Res Function(_$ListOfListsSuccess) then) =
      __$$ListOfListsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({ListViewVariant variant, List<ListEntry> lists});
}

/// @nodoc
class __$$ListOfListsSuccessCopyWithImpl<$Res>
    extends _$ListOfListsStateCopyWithImpl<$Res, _$ListOfListsSuccess>
    implements _$$ListOfListsSuccessCopyWith<$Res> {
  __$$ListOfListsSuccessCopyWithImpl(
      _$ListOfListsSuccess _value, $Res Function(_$ListOfListsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? lists = null,
  }) {
    return _then(_$ListOfListsSuccess(
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ListViewVariant,
      lists: null == lists
          ? _value._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<ListEntry>,
    ));
  }
}

/// @nodoc

class _$ListOfListsSuccess implements ListOfListsSuccess {
  const _$ListOfListsSuccess(
      {required this.variant, required final List<ListEntry> lists})
      : _lists = lists;

  @override
  final ListViewVariant variant;
  final List<ListEntry> _lists;
  @override
  List<ListEntry> get lists {
    if (_lists is EqualUnmodifiableListView) return _lists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  @override
  String toString() {
    return 'ListOfListsState.success(variant: $variant, lists: $lists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfListsSuccess &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._lists, _lists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, variant, const DeepCollectionEquality().hash(_lists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfListsSuccessCopyWith<_$ListOfListsSuccess> get copyWith =>
      __$$ListOfListsSuccessCopyWithImpl<_$ListOfListsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListViewVariant variant, List<ListEntry> lists)
        success,
    required TResult Function() loading,
  }) {
    return success(variant, lists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult? Function()? loading,
  }) {
    return success?.call(variant, lists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(variant, lists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListOfListsSuccess value) success,
    required TResult Function(ListOfListsLoading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListOfListsSuccess value)? success,
    TResult? Function(ListOfListsLoading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListOfListsSuccess value)? success,
    TResult Function(ListOfListsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ListOfListsSuccess implements ListOfListsState {
  const factory ListOfListsSuccess(
      {required final ListViewVariant variant,
      required final List<ListEntry> lists}) = _$ListOfListsSuccess;

  ListViewVariant get variant;
  List<ListEntry> get lists;
  @JsonKey(ignore: true)
  _$$ListOfListsSuccessCopyWith<_$ListOfListsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListOfListsLoadingCopyWith<$Res> {
  factory _$$ListOfListsLoadingCopyWith(_$ListOfListsLoading value,
          $Res Function(_$ListOfListsLoading) then) =
      __$$ListOfListsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListOfListsLoadingCopyWithImpl<$Res>
    extends _$ListOfListsStateCopyWithImpl<$Res, _$ListOfListsLoading>
    implements _$$ListOfListsLoadingCopyWith<$Res> {
  __$$ListOfListsLoadingCopyWithImpl(
      _$ListOfListsLoading _value, $Res Function(_$ListOfListsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ListOfListsLoading implements ListOfListsLoading {
  const _$ListOfListsLoading();

  @override
  String toString() {
    return 'ListOfListsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListOfListsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListViewVariant variant, List<ListEntry> lists)
        success,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListViewVariant variant, List<ListEntry> lists)? success,
    TResult Function()? loading,
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
    required TResult Function(ListOfListsSuccess value) success,
    required TResult Function(ListOfListsLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListOfListsSuccess value)? success,
    TResult? Function(ListOfListsLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListOfListsSuccess value)? success,
    TResult Function(ListOfListsLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ListOfListsLoading implements ListOfListsState {
  const factory ListOfListsLoading() = _$ListOfListsLoading;
}
