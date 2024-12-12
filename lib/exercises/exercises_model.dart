import '/components/exercises_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercises_widget.dart' show ExercisesWidget;
import 'package:flutter/material.dart';

class ExercisesModel extends FlutterFlowModel<ExercisesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for exercisesComp component.
  late ExercisesCompModel exercisesCompModel;

  @override
  void initState(BuildContext context) {
    exercisesCompModel = createModel(context, () => ExercisesCompModel());
  }

  @override
  void dispose() {
    exercisesCompModel.dispose();
  }
}
