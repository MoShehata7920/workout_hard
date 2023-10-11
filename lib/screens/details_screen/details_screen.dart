import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_hard/models/workout_model.dart';
import 'package:workout_hard/provider/workout_provide.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const routeName = 'single';

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;

    WorkOut workout =
        Provider.of<WorkOutData>(context, listen: false).findById(id);

    return Container();
  }
}
