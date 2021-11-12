import '../backend/api_requests/api_calls.dart';
import '../components/top_page_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../plan_page/plan_page_widget.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: FlutterFlowTheme.grayLight,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TopPageHeaderWidget(),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
                    child: FFButtonWidget(
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
                        width: 300,
                        height: 60,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.textLight,
                          fontSize: 24,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                      loading: _loadingButton,
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
