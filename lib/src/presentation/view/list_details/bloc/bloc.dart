import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import 'list_details.dart';

@Injectable()
class ListDetailsBloc extends Bloc<ListDetailsEvent, ListDetailsState> {
  ListDetailsBloc({
    @factoryParam required this.transaction,
    @factoryParam required this.router,
  }) : super(ListDetailsState.loading()) {
    on<ListDetailsInit>(_init);
    on<ListDetailsAdd>(_add);
    on<ListDetailsEdit>(_edit);
  }

  final RouterEventSink router;
  final ListDetailsTransaction transaction;

  _init(ListDetailsInit event, Emitter emitter) {}

  _add(ListDetailsAdd event, Emitter emitter) {}

  _edit(ListDetailsEdit event, Emitter emitter) {}
}
