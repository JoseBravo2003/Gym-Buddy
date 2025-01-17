import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exercises_comp_model.dart';
export 'exercises_comp_model.dart';

class ExercisesCompWidget extends StatefulWidget {
  const ExercisesCompWidget({super.key});

  @override
  State<ExercisesCompWidget> createState() => _ExercisesCompWidgetState();
}

class _ExercisesCompWidgetState extends State<ExercisesCompWidget> {
  late ExercisesCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExercisesCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9F7F7),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Add (${_model.total.toString()})',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFF0C0C0C),
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            StreamBuilder<List<ExercisesRecord>>(
              stream: queryExercisesRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ExercisesRecord> listViewExercisesRecordList =
                    snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewExercisesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewExercisesRecord =
                        listViewExercisesRecordList[listViewIndex];
                    return Material(
                      color: Colors.transparent,
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValueMap[
                                  listViewExercisesRecord] ??=
                              FFAppState()
                                  .workout
                                  .exercises
                                  .map((e) => e.exerciseRef?.id)
                                  .withoutNulls
                                  .toList()
                                  .contains(
                                      listViewExercisesRecord.reference.id),
                          onChanged: (newValue) async {
                            safeSetState(() => _model.checkboxListTileValueMap[
                                listViewExercisesRecord] = newValue!);
                            if (newValue!) {
                              _model.total = _model.total + 1;
                              safeSetState(() {});
                              FFAppState().updateWorkoutStruct(
                                (e) => e
                                  ..updateExercises(
                                    (e) => e.add(ExerciseStruct(
                                      exerciseRef:
                                          listViewExercisesRecord.reference,
                                      sets: functions.createSets(),
                                    )),
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              _model.total = _model.total + -1;
                              safeSetState(() {});
                            }
                          },
                          title: Text(
                            listViewExercisesRecord.name,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          subtitle: Text(
                            listViewExercisesRecord.bodyPart,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'g7d2wt1b' /* Aceptar */,
                  ),
                  options: FFButtonOptions(
                    width: 250.0,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
