import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPageWidget extends StatefulWidget {
  PlanPageWidget({
    Key key,
    this.plans,
  }) : super(key: key);

  final dynamic plans;

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
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
      backgroundColor: FlutterFlowTheme.grayLight,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          MainMenuWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 40, 10, 40),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.grayDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                                    widget.plans, r'''$.result.plans[1].name''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1,
                          ),
                          Text(
                            getJsonField(widget.plans,
                                    r'''$.result.plans[1].prices[0].unitAmount''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1,
                          ),
                          Text(
                            getJsonField(widget.plans,
                                    r'''$.result.plans[1].prices[0]. interval''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1,
                          ),
                          Text(
                            getJsonField(widget.plans,
                                    r'''$.result.plans[1].prices[0]. intervalCount''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
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
