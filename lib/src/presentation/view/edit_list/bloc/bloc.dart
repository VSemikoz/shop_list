import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/presentation/view/edit_list/bloc/edit_list.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/usecases/create_list.dart';

@Injectable()
class EditListBloc extends Bloc<EditListEvent, EditListState> {
  EditListBloc({
    @factoryParam required this.transaction,
    @factoryParam required this.router,
    required this.useCase,
  }) : super(EditListState.loading()) {
    _currentColor = transaction.initColor;
    currentColorController = BehaviorSubject.seeded(_currentColor);
    on<EditListInit>(_init);
    on<EditListAdd>(_add);
  }

  RouterEventSink router;
  final CreateListTransaction transaction;
  final CreateListUseCaseBase useCase;

  late Color _currentColor;
  String _currentText = "";

  late BehaviorSubject<Color> currentColorController;

  _init(EditListInit event, Emitter emitter) {
    _updateSuccess(emitter);
  }

  _add(EditListAdd event, Emitter emitter) async {
    final entry = ListEntry.insert(name: _currentText, color: _currentColor);
    await useCase.createList(entry);
    transaction.onSuccess();
    router.add(RouterEvent.pop());
  }

  updateText(String text) {
    _currentText = text;
  }

  updateColor(Color color) {
    _currentColor = color;
    currentColorController.add(_currentColor);
  }

  _updateSuccess(Emitter emitter) {
    emitter(EditListState.success(name: _currentText, color: _currentColor));
  }
}