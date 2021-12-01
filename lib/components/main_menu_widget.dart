import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../config_page/config_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../post_page/post_page_widget.dart';
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
  bool _loadingButton1 = false;
  dynamic subscriptionConfig;
  dynamic subscriptionPost;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.secondaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.secondaryColor,
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Text(
                'Makuhari Bay Life',
                style: FlutterFlowTheme.subtitle1.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.textLight,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 20, 20),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'ホーム',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onTap: () async {
                        subscriptionPost = await getSubscriptionCall(
                          uid: currentUserUid,
                        );
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostPageWidget(
                              subscription: getJsonField(subscriptionPost,
                                      r'''$.result.subscription''')
                                  .toString(),
                            ),
                          ),
                        );

                        setState(() {});
                      },
                      child: Text(
                        '投稿',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onTap: () async {
                        subscriptionConfig = await getSubscriptionCall(
                          uid: currentUserUid,
                        );
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfigPageWidget(
                              subscription: subscriptionConfig,
                            ),
                          ),
                        );

                        setState(() {});
                      },
                      child: Text(
                        '設定',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 56, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton1 = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton1 = false);
                        }
                      },
                      text: 'ホーム',
                      icon: Icon(
                        Icons.home_sharp,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 48,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: 0,
                      ),
                      loading: _loadingButton1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 56, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton2 = true);
                        try {
                          await getSubscriptionCall(
                            uid: currentUserUid,
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfigPageWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton2 = false);
                        }
                      },
                      text: '投稿　',
                      icon: Icon(
                        Icons.post_add_sharp,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 48,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: 0,
                      ),
                      loading: _loadingButton2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 56, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton3 = true);
                        try {
                          await getSubscriptionCall(
                            uid: currentUserUid,
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfigPageWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton3 = false);
                        }
                      },
                      text: '設定　',
                      icon: Icon(
                        Icons.settings_sharp,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 48,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 16,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: 0,
                      ),
                      loading: _loadingButton3,
                    ),
                  )
                ],
              ),
            ),
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
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.textLight,
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.textLight,
                    size: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
