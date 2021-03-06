import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../config_page/config_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../post_page/post_page_widget.dart';
import '../post_survey_page/post_survey_page_widget.dart';
import '../top_page/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuWidget extends StatefulWidget {
  const MainMenuWidget({Key key}) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  ApiCallResponse subscriptionConfig;
  ApiCallResponse subscriptionPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Text(
                    'Makuhari Bay Life',
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).textLight,
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 800,
                  decoration: BoxDecoration(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: 48,
                        child: Stack(
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageWidget(),
                                  ),
                                );
                              },
                              text: '?????????',
                              options: FFButtonOptions(
                                width: 160,
                                height: 48,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                      fontSize: 16,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0),
                              child: Icon(
                                Icons.home_sharp,
                                color: FlutterFlowTheme.of(context).textLight,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Stack(
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                subscriptionPost =
                                    await GetSubscriptionCall.call(
                                  uid: currentUserUid,
                                );
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostPageWidget(
                                      subscription: getJsonField(
                                        (subscriptionPost?.jsonBody ?? ''),
                                        r'''$.result.subscription''',
                                      ).toString(),
                                    ),
                                  ),
                                );

                                setState(() {});
                              },
                              text: '?????????',
                              options: FFButtonOptions(
                                width: 160,
                                height: 48,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                      fontSize: 16,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0),
                              child: Icon(
                                Icons.post_add_sharp,
                                color: FlutterFlowTheme.of(context).textLight,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PostSurveyPageWidget(),
                                    ),
                                  );
                                },
                                text: '???????????????',
                                options: FFButtonOptions(
                                  width: 160,
                                  height: 48,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .textLight,
                                        fontSize: 16,
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: 0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0),
                              child: Icon(
                                Icons.question_answer_rounded,
                                color: FlutterFlowTheme.of(context).textLight,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Stack(
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                subscriptionConfig =
                                    await GetSubscriptionCall.call(
                                  uid: currentUserUid,
                                );
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConfigPageWidget(
                                      subscription:
                                          (subscriptionConfig?.jsonBody ?? ''),
                                    ),
                                  ),
                                );

                                setState(() {});
                              },
                              text: '?????????',
                              options: FFButtonOptions(
                                width: 160,
                                height: 48,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .textLight,
                                      fontSize: 16,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, 0),
                              child: Icon(
                                Icons.settings_sharp,
                                color: FlutterFlowTheme.of(context).textLight,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopPageWidget(),
                  ),
                  (r) => false,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Logout',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).textLight,
                        ),
                  ),
                  Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).textLight,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
