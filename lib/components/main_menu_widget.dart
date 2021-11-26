import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../config_page/config_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import '../post_page/post_page_widget.dart';
import '../top_page/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuWidget extends StatefulWidget {
  MainMenuWidget({Key key}) : super(key: key);

  @override
  _MainMenuWidgetState createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  dynamic subscriptionConfig;
  dynamic subscriptionPost;

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
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
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
