import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_details.dart';

class ListDetailsScreen extends StatelessWidget {
  static String id = "list_details";

  const ListDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListDetailsBloc, ListDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              //TODO
            ],
          ),
        );
      },
    );
  }
}
