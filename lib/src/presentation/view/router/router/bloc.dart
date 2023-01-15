import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../delegate.dart';
import 'router.dart';

abstract class RouterEventSink {
  void add(RouterEvent event);
}

@Singleton(as: RouterEventSink)
class RouterBloc extends Bloc<RouterEvent, List<RouteInfo>>
    implements RouterEventSink {
  RouterBloc() : super([ScreenProvider.listOfLists()]) {
    on<RouteOnPop>((event, emit) => _onPop(event, emit));
    on<RouteOnPopTop>((event, emit) => _onPopTop(event, emit));
    on<RouteListOfLists>(_listOfLists);
    on<RouteCreateList>(_createList);
    on<RouteFavorite>(_favorite);
    on<RouteCategory>(_category);
    on<RouteBucket>(_bucket);
  }

  List<RouteInfo> get stack => state;

  _onPop(RouteOnPop event, Emitter<List<RouteInfo>> emit) {
    final List<RouteInfo> newStack = [];
    stack.forEach((element) => newStack.add(element));
    newStack.removeLast();
    emit(newStack);
  }

  _onPopTop(RouteOnPopTop event, Emitter<List<RouteInfo>> emit) {
    if (stack.length <= event.n) return;

    final List<RouteInfo> newStack = [];
    var index = 0;
    stack.forEach((element) => newStack.add(element));
    while (index < event.n) {
      newStack.removeLast();
      index += 1;
    }
    emit(newStack);
  }

  _createList(RouteCreateList event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.createList(event.transaction)));
  }

  _listOfLists(RouteListOfLists event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.listOfLists()));
  }

  // If [routeInfo] present in stack - remove it, add to top with [_addToTop]
  // else add to top
  List<RouteInfo> _rebaseRoute(RouteInfo routeInfo) {
    final index = stack.indexWhere((s) => s.id == routeInfo.id);
    if (index == -1) return _addIntoTop(routeInfo);
    stack.removeAt(index);
    return _addIntoTop(routeInfo);
  }

  List<RouteInfo> _addIntoTop(RouteInfo routeInfo) {
    return [...stack, routeInfo];
  }

  _favorite(RouteFavorite event, Emitter emitter) {}

  _category(RouteCategory event, Emitter emitter) {}

  _bucket(RouteBucket event, Emitter emitter) {}
}
