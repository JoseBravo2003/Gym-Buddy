import '/components/input_reps_widget.dart';
import '/components/input_wei_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'start_workout_comp_widget.dart' show StartWorkoutCompWidget;
import 'package:flutter/material.dart';

class StartWorkoutCompModel extends FlutterFlowModel<StartWorkoutCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputWorkoutName widget.
  FocusNode? inputWorkoutNameFocusNode;
  TextEditingController? inputWorkoutNameTextController;
  String? Function(BuildContext, String?)?
      inputWorkoutNameTextControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Models for inputWei dynamic component.
  late FlutterFlowDynamicModels<InputWeiModel> inputWeiModels;
  // Models for inputReps dynamic component.
  late FlutterFlowDynamicModels<InputRepsModel> inputRepsModels;

  @override
  void initState(BuildContext context) {
    inputWeiModels = FlutterFlowDynamicModels(() => InputWeiModel());
    inputRepsModels = FlutterFlowDynamicModels(() => InputRepsModel());
  }

  @override
  void dispose() {
    inputWorkoutNameFocusNode?.dispose();
    inputWorkoutNameTextController?.dispose();

    timerController.dispose();
    inputWeiModels.dispose();
    inputRepsModels.dispose();
  }
}
