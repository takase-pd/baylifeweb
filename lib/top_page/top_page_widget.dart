import '../backend/api_requests/api_calls.dart';
import '../components/top_page_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageWidget extends StatefulWidget {
  TopPageWidget({Key key}) : super(key: key);

  @override
  _TopPageWidgetState createState() => _TopPageWidgetState();
}

class _TopPageWidgetState extends State<TopPageWidget> {
  bool _loadingButton = false;
  dynamic plans;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopPageHeaderWidget(),
            Container(
              width: double.infinity,
              height: 720,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.background,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '住民とつながる',
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 64,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '幕張ベイタウン、ベイパーク',
                                  style: FlutterFlowTheme.title2,
                                ),
                              )
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
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
                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'プラン確認',
                          options: FFButtonOptions(
                            width: 240,
                            height: 60,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: FlutterFlowTheme.title2.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.textLight,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                          loading: _loadingButton,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://picsum.photos/seed/81/600',
                          width: double.infinity,
                          height: 500,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
              child: Container(
                width: double.infinity,
                height: 360,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Text(
                        'About',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textDark,
                        ),
                      ),
                    ),
                    Text(
                      'Hello World',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Open Sans',
                        color: FlutterFlowTheme.textDark,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
              child: Container(
                width: double.infinity,
                height: 720,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.background,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://picsum.photos/seed/81/600',
                            width: double.infinity,
                            height: 500,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  'オンラインでつながる',
                                  style: FlutterFlowTheme.title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  'アプリで投稿見る',
                                  style: FlutterFlowTheme.subtitle1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  'Makuhari Bay Life',
                                  style: FlutterFlowTheme.title2,
                                ),
                              )
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/Download_on_the_App_Store_Badge_US-UK_RGB_blk_092917.svg',
                            width: 180,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 960,
                    height: 360,
                    decoration: BoxDecoration(),
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
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'プラン',
                                    style: FlutterFlowTheme.bodyText1,
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
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'ログイン',
                                    style: FlutterFlowTheme.bodyText1,
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
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Open Sans',
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
                                    child: Text(
                                      '利用規約',
                                      style: FlutterFlowTheme.bodyText1,
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
                        ),
                        Text(
                          'Copyright © 2021 Particle Drawing LLC.  All rights reserved.',
                          style: FlutterFlowTheme.bodyText1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
