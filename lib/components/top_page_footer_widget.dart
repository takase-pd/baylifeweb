import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../plan_page/plan_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageFooterWidget extends StatefulWidget {
  const TopPageFooterWidget({Key key}) : super(key: key);

  @override
  _TopPageFooterWidgetState createState() => _TopPageFooterWidgetState();
}

class _TopPageFooterWidgetState extends State<TopPageFooterWidget> {
  dynamic plans;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 480,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 1120,
            height: 400,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 72,
                  thickness: 1,
                  color: FlutterFlowTheme.tDark,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Text(
                                    'ご検討中の方',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      plans = await getPlanCall();
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlanPageWidget(
                                            plans: plans,
                                          ),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    child: Text(
                                      'プラン',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://particledrawing.notion.site/Use-Case-a8f406da8ffc44ab991a371c1596297b');
                                    },
                                    child: Text(
                                      '利用例',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Text(
                                    'ご利用中の方',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPageWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'ログイン',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://particledrawing.notion.site/What-s-New-ce7fec05daa640a49f38e9cb29583901');
                                    },
                                    child: Text(
                                      'What\'s New?',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Text(
                                    '運営会社',
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://www.particledrawing.com/');
                                    },
                                    child: Text(
                                      '会社情報',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://baylife-ff782.web.app/terms.html');
                                    },
                                    child: Text(
                                      '利用規約',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://www.particledrawing.com/privacy');
                                    },
                                    child: Text(
                                      'プライバシーポリシー',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            'Copyright © 2021 Particle Drawing, LLC.  All rights reserved.',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Open Sans',
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
