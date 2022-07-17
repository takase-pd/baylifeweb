import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key key,
    this.subscription,
  }) : super(key: key);

  final dynamic subscription;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: Column(
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 40),
                    child: StreamBuilder<List<ContentsRecord>>(
                      stream: queryContentsRecord(
                        queryBuilder: (contentsRecord) => contentsRecord
                            .where('uid', isEqualTo: currentUserReference),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitPulse(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<ContentsRecord> columnContentsRecordList =
                            snapshot.data;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnContentsRecordList.length, (columnIndex) {
                              final columnContentsRecord =
                                  columnContentsRecordList[columnIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 10, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              columnContentsRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                      'yMMMd',
                                                      columnContentsRecord
                                                          .posted),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final contentsUpdateData =
                                                        createContentsRecordData(
                                                      display:
                                                          !columnContentsRecord
                                                              .display,
                                                    );
                                                    await columnContentsRecord
                                                        .reference
                                                        .update(
                                                            contentsUpdateData);
                                                  },
                                                  value: columnContentsRecord
                                                      .display,
                                                  onIcon: Icon(
                                                    Icons.cloud_done,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pDark,
                                                    size: 25,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.cloud_off_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pDark,
                                                    size: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          columnContentsRecord.overview
                                              .maybeHandleOverflow(
                                            maxChars: 56,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textDark,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
