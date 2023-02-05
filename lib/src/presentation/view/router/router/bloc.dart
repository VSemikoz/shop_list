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
    on<RouteEditList>(_editList);
    on<RouteListDetails>(_listDetails);
    on<RouteFavorite>(_favorite);
    on<RouteCategoryList>(_categoryList);
    on<RouteEditCategory>(_editCategory);
    on<RouteBucket>(_bucket);
    on<RouteEditProduct>(_editProduct);
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

  _editList(RouteEditList event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.editList(event.transaction)));
  }

  _listOfLists(RouteListOfLists event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.listOfLists()));
  }

  _listDetails(RouteListDetails event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.listDetails(event.transaction)));
  }

  _favorite(RouteFavorite event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.favorite()));
  }

  _categoryList(RouteCategoryList event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.categoryList()));
  }

  _editCategory(RouteEditCategory event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.editCategory(event.transaction)));
  }

  _bucket(RouteBucket event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.bucket()));
  }

  _editProduct(RouteEditProduct event, Emitter emitter) {
    emitter(_rebaseRoute(ScreenProvider.editProduct(event.transaction)));
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
}
