import '/flutter_flow/flutter_flow_util.dart';
import 'input_wei_widget.dart' show InputWeiWidget;
import 'package:flutter/material.dart';

class InputWeiModel extends FlutterFlowModel<InputWeiWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
