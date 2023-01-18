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
mixin _$EditListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function() edit,
    required TResult Function() delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function()? edit,
    TResult? Function()? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function()? edit,
    TResult Function()? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditListInit value) init,
    required TResult Function(EditListAdd value) add,
    required TResult Function(EditListEdit value) edit,
    required TResult Function(EditListDelete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListInit value)? init,
    TResult? Function(EditListAdd value)? add,
    TResult? Function(EditListEdit value)? edit,
    TResult? Function(EditListDelete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListInit value)? init,
    TResult Function(EditListAdd value)? add,
    TResult Function(EditListEdit value)? edit,
    TResult Function(EditListDelete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditListEventCopyWith<$Res> {
  factory $EditListEventCopyWith(
          EditListEvent value, $Res Function(EditListEvent) then) =
      _$EditListEventCopyWithImpl<$Res, EditListEvent>;
}

/// @nodoc
class _$EditListEventCopyWithImpl<$Res, $Val extends EditListEvent>
    implements $EditListEventCopyWith<$Res> {
  _$EditListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditListInitCopyWith<$Res> {
  factory _$$EditListInitCopyWith(
          _$EditListInit value, $Res Function(_$EditListInit) then) =
      __$$EditListInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditListInitCopyWithImpl<$Res>
    extends _$EditListEventCopyWithImpl<$Res, _$EditListInit>
    implements _$$EditListInitCopyWith<$Res> {
  __$$EditListInitCopyWithImpl(
      _$EditListInit _value, $Res Function(_$EditListInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditListInit implements EditListInit {
  const _$EditListInit();

  @override
  String toString() {
    return 'EditListEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditListInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function() edit,
    required TResult Function() delete,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function()? edit,
    TResult? Function()? delete,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function()? edit,
    TResult Function()? delete,
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
    required TResult Function(EditListInit value) init,
    required TResult Function(EditListAdd value) add,
    required TResult Function(EditListEdit value) edit,
    required TResult Function(EditListDelete value) delete,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListInit value)? init,
    TResult? Function(EditListAdd value)? add,
    TResult? Function(EditListEdit value)? edit,
    TResult? Function(EditListDelete value)? delete,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListInit value)? init,
    TResult Function(EditListAdd value)? add,
    TResult Function(EditListEdit value)? edit,
    TResult Function(EditListDelete value)? delete,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class EditListInit implements EditListEvent {
  const factory EditListInit() = _$EditListInit;
}

/// @nodoc
abstract class _$$EditListAddCopyWith<$Res> {
  factory _$$EditListAddCopyWith(
          _$EditListAdd value, $Res Function(_$EditListAdd) then) =
      __$$EditListAddCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditListAddCopyWithImpl<$Res>
    extends _$EditListEventCopyWithImpl<$Res, _$EditListAdd>
    implements _$$EditListAddCopyWith<$Res> {
  __$$EditListAddCopyWithImpl(
      _$EditListAdd _value, $Res Function(_$EditListAdd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditListAdd implements EditListAdd {
  const _$EditListAdd();

  @override
  String toString() {
    return 'EditListEvent.add()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditListAdd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function() edit,
    required TResult Function() delete,
  }) {
    return add();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function()? edit,
    TResult? Function()? delete,
  }) {
    return add?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function()? edit,
    TResult Function()? delete,
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
    required TResult Function(EditListInit value) init,
    required TResult Function(EditListAdd value) add,
    required TResult Function(EditListEdit value) edit,
    required TResult Function(EditListDelete value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListInit value)? init,
    TResult? Function(EditListAdd value)? add,
    TResult? Function(EditListEdit value)? edit,
    TResult? Function(EditListDelete value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListInit value)? init,
    TResult Function(EditListAdd value)? add,
    TResult Function(EditListEdit value)? edit,
    TResult Function(EditListDelete value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class EditListAdd implements EditListEvent {
  const factory EditListAdd() = _$EditListAdd;
}

/// @nodoc
abstract class _$$EditListEditCopyWith<$Res> {
  factory _$$EditListEditCopyWith(
          _$EditListEdit value, $Res Function(_$EditListEdit) then) =
      __$$EditListEditCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditListEditCopyWithImpl<$Res>
    extends _$EditListEventCopyWithImpl<$Res, _$EditListEdit>
    implements _$$EditListEditCopyWith<$Res> {
  __$$EditListEditCopyWithImpl(
      _$EditListEdit _value, $Res Function(_$EditListEdit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditListEdit implements EditListEdit {
  const _$EditListEdit();

  @override
  String toString() {
    return 'EditListEvent.edit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditListEdit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function() edit,
    required TResult Function() delete,
  }) {
    return edit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function()? edit,
    TResult? Function()? delete,
  }) {
    return edit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function()? edit,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditListInit value) init,
    required TResult Function(EditListAdd value) add,
    required TResult Function(EditListEdit value) edit,
    required TResult Function(EditListDelete value) delete,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListInit value)? init,
    TResult? Function(EditListAdd value)? add,
    TResult? Function(EditListEdit value)? edit,
    TResult? Function(EditListDelete value)? delete,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListInit value)? init,
    TResult Function(EditListAdd value)? add,
    TResult Function(EditListEdit value)? edit,
    TResult Function(EditListDelete value)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class EditListEdit implements EditListEvent {
  const factory EditListEdit() = _$EditListEdit;
}

/// @nodoc
abstract class _$$EditListDeleteCopyWith<$Res> {
  factory _$$EditListDeleteCopyWith(
          _$EditListDelete value, $Res Function(_$EditListDelete) then) =
      __$$EditListDeleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditListDeleteCopyWithImpl<$Res>
    extends _$EditListEventCopyWithImpl<$Res, _$EditListDelete>
    implements _$$EditListDeleteCopyWith<$Res> {
  __$$EditListDeleteCopyWithImpl(
      _$EditListDelete _value, $Res Function(_$EditListDelete) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditListDelete implements EditListDelete {
  const _$EditListDelete();

  @override
  String toString() {
    return 'EditListEvent.delete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditListDelete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() add,
    required TResult Function() edit,
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? add,
    TResult? Function()? edit,
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? add,
    TResult Function()? edit,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditListInit value) init,
    required TResult Function(EditListAdd value) add,
    required TResult Function(EditListEdit value) edit,
    required TResult Function(EditListDelete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditListInit value)? init,
    TResult? Function(EditListAdd value)? add,
    TResult? Function(EditListEdit value)? edit,
    TResult? Function(EditListDelete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditListInit value)? init,
    TResult Function(EditListAdd value)? add,
    TResult Function(EditListEdit value)? edit,
    TResult Function(EditListDelete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class EditListDelete implements EditListEvent {
  const factory EditListDelete() = _$EditListDelete;
}
