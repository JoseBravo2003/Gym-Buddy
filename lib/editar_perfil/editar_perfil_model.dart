import '/flutter_flow/flutter_flow_util.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:flutter/material.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  // State field(s) for Ape widget.
  FocusNode? apeFocusNode;
  TextEditingController? apeTextController;
  String? Function(BuildContext, String?)? apeTextControllerValidator;
  // State field(s) for Correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  // State field(s) for Peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for Edad widget.
  FocusNode? edadFocusNode;
  TextEditingController? edadTextController;
  String? Function(BuildContext, String?)? edadTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    apeFocusNode?.dispose();
    apeTextController?.dispose();

    correoFocusNode?.dispose();
    correoTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    edadFocusNode?.dispose();
    edadTextController?.dispose();
  }
}
