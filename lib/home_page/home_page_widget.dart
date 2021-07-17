import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.tertiaryColor,
              border: Border.all(
                width: 0.05,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'MAKUHARI Bay Life',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 240,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.tertiaryColor,
                  border: Border.all(
                    width: 0.05,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<InfoAdminRecord>>(
                      stream: queryInfoAdminRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                            ),
                          );
                        }
                        List<InfoAdminRecord> columnInfoAdminRecordList =
                            snapshot.data;
                        // Customize what your widget looks like with no query results.
                        if (snapshot.data.isEmpty) {
                          return Container(
                            height: 100,
                            child: Center(
                              child: Text('No results.'),
                            ),
                          );
                        }
                        final columnInfoAdminRecord =
                            columnInfoAdminRecordList.first;
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '投稿',
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                columnInfoAdminRecord.postInfo,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
