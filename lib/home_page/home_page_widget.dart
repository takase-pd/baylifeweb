import '../backend/api_requests/api_calls.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  dynamic aaa;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: HeaderWidget(),
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      endDrawer: Drawer(
        elevation: 16,
        child: MainMenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await registContentCall(
                        name: 'Yuji Takase',
                        email: 'yuji.takase@particledrawing.com',
                        content: 'テスト送信',
                      );
                    },
                    text: 'API',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      aaa = await helloWorldCall();

                      setState(() {});
                    },
                    text: 'API',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'API',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Hello World',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ),
    );
  }
}
