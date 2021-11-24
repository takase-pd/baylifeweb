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
  HomePageWidget({
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: HeaderWidget(),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
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
                                color: FlutterFlowTheme.primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<ContentsRecord> columnContentsRecordList =
                            snapshot.data;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnContentsRecordList.length, (columnIndex) {
                            final columnContentsRecord =
                                columnContentsRecordList[columnIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.tertiaryColor,
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
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Open Sans',
                                              color: FlutterFlowTheme.textDark,
                                            ),
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
                                                style: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Open Sans',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                ),
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
                                                  color: FlutterFlowTheme.pDark,
                                                  size: 25,
                                                ),
                                                offIcon: Icon(
                                                  Icons.cloud_off_outlined,
                                                  color: FlutterFlowTheme.pDark,
                                                  size: 25,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Text(
                                        columnContentsRecord.overview
                                            .maybeHandleOverflow(
                                          maxChars: 70,
                                          replacement: '…',
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
