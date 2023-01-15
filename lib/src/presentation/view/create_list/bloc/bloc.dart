import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/presentation/view/create_list/bloc/create_list.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/usecases/create_list.dart';

@Injectable()
class CreateListBloc extends Bloc<CreateListEvent, CreateListState> {
  CreateListBloc({
    @factoryParam required this.transaction,
    @factoryParam required this.router,
    required this.useCase,
  }) : super(CreateListState.loading()) {
    _currentColor = transaction.initColor;
    currentColorController = BehaviorSubject.seeded(_currentColor);
    on<CreateListInit>(_init);
    on<CreateListAdd>(_add);
  }

  RouterEventSink router;
  final CreateListTransaction transaction;
  final CreateListUseCaseBase useCase;

  late Color _currentColor;
  String _currentText = "";

  late BehaviorSubject<Color> currentColorController;

  _init(CreateListInit event, Emitter emitter) {
    _updateSuccess(emitter);
  }

  _add(CreateListAdd event, Emitter emitter) async {
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
    emitter(CreateListState.success(name: _currentText, color: _currentColor));
  }
}
