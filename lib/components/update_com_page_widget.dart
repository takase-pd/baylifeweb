import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateComPageWidget extends StatefulWidget {
  const UpdateComPageWidget({
    Key key,
    this.company,
  }) : super(key: key);

  final CompaniesRecord company;

  @override
  _UpdateComPageWidgetState createState() => _UpdateComPageWidgetState();
}

class _UpdateComPageWidgetState extends State<UpdateComPageWidget> {
  DocumentReference directorRef;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  final formKey = GlobalKey<FormState>();

  CompaniesRecord company;
  bool isNew = true;
  String label = '追加';
  String alert = '';

  @override
  void initState() {
    super.initState();
    if (widget.company == null)
      company = CompaniesRecord();
    else {
      isNew = false;
      company = widget.company;
      textController1 = TextEditingController(text: company.name);
      directorRef = company.director;
      textController3 = TextEditingController(text: company.web);
      label = '更新';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.48,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '企業',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: TextFormField(
                                  controller: textController1 ??=
                                      TextEditingController(),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '企業名',
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    errorStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .textDark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (val) {
                                    return val == null || val.isEmpty
                                        ? '企業名を入力してください。'
                                        : null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitPulse(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> containerUsersRecordList =
                              snapshot.data;
                          List<String> usersList = containerUsersRecordList
                              .map((e) => e.uid)
                              .toList();
                          textController2 = directorRef == null
                              ? TextEditingController()
                              : TextEditingController(
                                  text: containerUsersRecordList
                                      .firstWhere(
                                        (element) =>
                                            element.reference == directorRef,
                                      )
                                      .uid);
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 8),
                                    child: TextFormField(
                                      controller: textController2,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '管理者',
                                        isDense: true,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        errorStyle: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (val) {
                                        return val == null || val.isEmpty
                                            ? '管理者を選択してください。'
                                            : null;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlutterFlowDropDown(
                                    options: usersList,
                                    onChanged: (val) => setState(() =>
                                        directorRef = FirebaseFirestore.instance
                                            .doc('/users/$val')),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.black,
                                        ),
                                    hintText: 'ユーザーID',
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0,
                                    borderRadius: 0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: TextFormField(
                                  controller: textController3 ??=
                                      TextEditingController(),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'URL',
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    errorStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .textDark,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              alert,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w500,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'UPDATE_COM_PAGE_COMP_${label}_BTN_ON_TAP');
                                if (!formKey.currentState.validate()) {
                                  setState(() {
                                    alert = '必要事項を入力してください。';
                                  });
                                  return;
                                }
                                setState(() {
                                  alert = '';
                                });

                                logFirebaseEvent('Button_Alert-Dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('企業$label'),
                                              content: Text('企業を$labelします。'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Button_Backend-Call');

                                  final companiesCreateData =
                                      createCompaniesRecordData(
                                    name: textController1.text,
                                    director: directorRef,
                                    web: textController3.text,
                                  );
                                  isNew
                                      ? await CompaniesRecord.collection
                                          .doc()
                                          .set(companiesCreateData)
                                      : await company.reference
                                          .update(companiesCreateData);
                                  logFirebaseEvent('Button_Show-Snack-Bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '企業を$labelしました。',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                  logFirebaseEvent('Button_Navigate-To');
                                  Navigator.pop(context);
                                  return;
                                } else {
                                  return;
                                }
                              },
                              text: label,
                              options: FFButtonOptions(
                                width: 130,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
