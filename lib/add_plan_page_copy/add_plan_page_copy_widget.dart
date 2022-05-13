import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPlanPageCopyWidget extends StatefulWidget {
  const AddPlanPageCopyWidget({Key key}) : super(key: key);

  @override
  _AddPlanPageCopyWidgetState createState() => _AddPlanPageCopyWidgetState();
}

class _AddPlanPageCopyWidgetState extends State<AddPlanPageCopyWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddPlanPageCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HeaderWidget(),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainMenuWidget(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  indicatorColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  tabs: [
                                    Tab(
                                      text: 'Example 1',
                                    ),
                                    Tab(
                                      text: 'Example 2',
                                    ),
                                    Tab(
                                      text: 'Example 3',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Text(
                                        'Tab View 1',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 32,
                                            ),
                                      ),
                                      Text(
                                        'Tab View 2',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 32,
                                            ),
                                      ),
                                      Text(
                                        'Tab View 3',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontSize: 32,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
