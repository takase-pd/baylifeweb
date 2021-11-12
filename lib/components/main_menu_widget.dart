import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../config_page/config_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import '../post_page/post_page_widget.dart';
import '../top_page/top_page_widget.dart';
import 'package:flutter/material.dart';
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
      width: 240,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.grayDark,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textPrimary,
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
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textPrimary,
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
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textPrimary,
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
                      color: FlutterFlowTheme.textDark,
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.black,
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
