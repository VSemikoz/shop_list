// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoriesListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function(CategoryEntry entry) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function(CategoryEntry entry)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function(CategoryEntry entry)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListInit value) init,
    required TResult Function(CategoriesListAdd value) add,
    required TResult Function(CategoriesListEdit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListInit value)? init,
    TResult? Function(CategoriesListAdd value)? add,
    TResult? Function(CategoriesListEdit value)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListInit value)? init,
    TResult Function(CategoriesListAdd value)? add,
    TResult Function(CategoriesListEdit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesListEventCopyWith<$Res> {
  factory $CategoriesListEventCopyWith(
          CategoriesListEvent value, $Res Function(CategoriesListEvent) then) =
      _$CategoriesListEventCopyWithImpl<$Res, CategoriesListEvent>;
}

/// @nodoc
class _$CategoriesListEventCopyWithImpl<$Res, $Val extends CategoriesListEvent>
    implements $CategoriesListEventCopyWith<$Res> {
  _$CategoriesListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoriesListInitCopyWith<$Res> {
  factory _$$CategoriesListInitCopyWith(_$CategoriesListInit value,
          $Res Function(_$CategoriesListInit) then) =
      __$$CategoriesListInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesListInitCopyWithImpl<$Res>
    extends _$CategoriesListEventCopyWithImpl<$Res, _$CategoriesListInit>
    implements _$$CategoriesListInitCopyWith<$Res> {
  __$$CategoriesListInitCopyWithImpl(
      _$CategoriesListInit _value, $Res Function(_$CategoriesListInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoriesListInit implements CategoriesListInit {
  const _$CategoriesListInit();

  @override
  String toString() {
    return 'CategoriesListEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesListInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function(CategoryEntry entry) edit,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function(CategoryEntry entry)? edit,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function(CategoryEntry entry)? edit,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListInit value) init,
    required TResult Function(CategoriesListAdd value) add,
    required TResult Function(CategoriesListEdit value) edit,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListInit value)? init,
    TResult? Function(CategoriesListAdd value)? add,
    TResult? Function(CategoriesListEdit value)? edit,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListInit value)? init,
    TResult Function(CategoriesListAdd value)? add,
    TResult Function(CategoriesListEdit value)? edit,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class CategoriesListInit implements CategoriesListEvent {
  const factory CategoriesListInit() = _$CategoriesListInit;
}

/// @nodoc
abstract class _$$CategoriesListAddCopyWith<$Res> {
  factory _$$CategoriesListAddCopyWith(
          _$CategoriesListAdd value, $Res Function(_$CategoriesListAdd) then) =
      __$$CategoriesListAddCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesListAddCopyWithImpl<$Res>
    extends _$CategoriesListEventCopyWithImpl<$Res, _$CategoriesListAdd>
    implements _$$CategoriesListAddCopyWith<$Res> {
  __$$CategoriesListAddCopyWithImpl(
      _$CategoriesListAdd _value, $Res Function(_$CategoriesListAdd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoriesListAdd implements CategoriesListAdd {
  const _$CategoriesListAdd();

  @override
  String toString() {
    return 'CategoriesListEvent.add()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesListAdd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function(CategoryEntry entry) edit,
  }) {
    return add();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function(CategoryEntry entry)? edit,
  }) {
    return add?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function(CategoryEntry entry)? edit,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListInit value) init,
    required TResult Function(CategoriesListAdd value) add,
    required TResult Function(CategoriesListEdit value) edit,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListInit value)? init,
    TResult? Function(CategoriesListAdd value)? add,
    TResult? Function(CategoriesListEdit value)? edit,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListInit value)? init,
    TResult Function(CategoriesListAdd value)? add,
    TResult Function(CategoriesListEdit value)? edit,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class CategoriesListAdd implements CategoriesListEvent {
  const factory CategoriesListAdd() = _$CategoriesListAdd;
}

/// @nodoc
abstract class _$$CategoriesListEditCopyWith<$Res> {
  factory _$$CategoriesListEditCopyWith(_$CategoriesListEdit value,
          $Res Function(_$CategoriesListEdit) then) =
      __$$CategoriesListEditCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryEntry entry});
}

/// @nodoc
class __$$CategoriesListEditCopyWithImpl<$Res>
    extends _$CategoriesListEventCopyWithImpl<$Res, _$CategoriesListEdit>
    implements _$$CategoriesListEditCopyWith<$Res> {
  __$$CategoriesListEditCopyWithImpl(
      _$CategoriesListEdit _value, $Res Function(_$CategoriesListEdit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$CategoriesListEdit(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as CategoryEntry,
    ));
  }
}

/// @nodoc

class _$CategoriesListEdit implements CategoriesListEdit {
  const _$CategoriesListEdit(this.entry);

  @override
  final CategoryEntry entry;

  @override
  String toString() {
    return 'CategoriesListEvent.edit(entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesListEdit &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesListEditCopyWith<_$CategoriesListEdit> get copyWith =>
      __$$CategoriesListEditCopyWithImpl<_$CategoriesListEdit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function(CategoryEntry entry) edit,
  }) {
    return edit(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function(CategoryEntry entry)? edit,
  }) {
    return edit?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function(CategoryEntry entry)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoriesListInit value) init,
    required TResult Function(CategoriesListAdd value) add,
    required TResult Function(CategoriesListEdit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoriesListInit value)? init,
    TResult? Function(CategoriesListAdd value)? add,
    TResult? Function(CategoriesListEdit value)? edit,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoriesListInit value)? init,
    TResult Function(CategoriesListAdd value)? add,
    TResult Function(CategoriesListEdit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class CategoriesListEdit implements CategoriesListEvent {
  const factory CategoriesListEdit(final CategoryEntry entry) =
      _$CategoriesListEdit;

  CategoryEntry get entry;
  @JsonKey(ignore: true)
  _$$CategoriesListEditCopyWith<_$CategoriesListEdit> get copyWith =>
      throw _privateConstructorUsedError;
}
