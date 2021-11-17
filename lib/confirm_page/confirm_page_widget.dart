import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPageWidget extends StatefulWidget {
  ConfirmPageWidget({
    Key key,
    this.catName,
    this.catNameAdd,
    this.title,
    this.overview,
    this.detail,
    this.startDay,
    this.finalDay,
    this.address,
    this.organizer,
    this.contact,
    this.homepage,
    this.permission,
    this.postName,
    this.postEmail,
    this.postPhone,
    this.postOccupation,
    this.postRemarks,
    this.filePath,
  }) : super(key: key);

  final String catName;
  final String catNameAdd;
  final String title;
  final String overview;
  final String detail;
  final DateTime startDay;
  final DateTime finalDay;
  final String address;
  final String organizer;
  final String contact;
  final String homepage;
  final bool permission;
  final String postName;
  final String postEmail;
  final String postPhone;
  final String postOccupation;
  final String postRemarks;
  final String filePath;

  @override
  _ConfirmPageWidgetState createState() => _ConfirmPageWidgetState();
}

class _ConfirmPageWidgetState extends State<ConfirmPageWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  dynamic aaa;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          HeaderWidget(),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                MainMenuWidget(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(36, 18, 8, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    '投稿 確認',
                                    style: FlutterFlowTheme.title1,
                                  ),
                                ),
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
                                          child: SpinKitPulse(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<InfoAdminRecord>
                                        textInfoAdminRecordList = snapshot.data;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data.isEmpty) {
                                      return Container();
                                    }
                                    final textInfoAdminRecord =
                                        textInfoAdminRecordList.isNotEmpty
                                            ? textInfoAdminRecordList.first
                                            : null;
                                    return Text(
                                      textInfoAdminRecord.postInfo,
                                      style: FlutterFlowTheme.bodyText1,
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    '投稿内容',
                                    style: FlutterFlowTheme.title2,
                                  ),
                                ),
                                Text(
                                  '投稿に表示されます。機密情報などは記載しないでください。',
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.catName,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.catNameAdd,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.title,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.overview,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.detail,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '添付画像',
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.textDark,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Image.network(
                                              valueOrDefault<String>(
                                                widget.filePath,
                                                'https://firebasestorage.googleapis.com/v0/b/baylife-ff782.appspot.com/o/assets%2FNoImage.png?alt=media&token=cfb3d70b-69d2-4f7f-be63-f429cc9872da',
                                              ),
                                              width: 100,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.address,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 0),
                                              child: Text(
                                                '開始日',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Open Sans',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'yMMMd', widget.startDay),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.textDark,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 0),
                                              child: Text(
                                                '終了日',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Open Sans',
                                                  color:
                                                      FlutterFlowTheme.textDark,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'yMMMd', widget.finalDay),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.textDark,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.organizer,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.contact,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.background,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 0, 10),
                                        child: Text(
                                          widget.homepage,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.textDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    '投稿者情報',
                                    style: FlutterFlowTheme.title2,
                                  ),
                                ),
                                Text(
                                  '投稿には表示されません。管理者が投稿の確認、連絡などに使用します。',
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postName,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postEmail,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postPhone,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 10),
                                    child: Text(
                                      widget.postOccupation,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '＊利用規約に従い投稿します。',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 12),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        decoration: BoxDecoration(),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue ??=
                                              widget.permission,
                                          onChanged: (newValue) => setState(
                                              () => checkboxListTileValue =
                                                  newValue),
                                          title: Text(
                                            '上記内容に同意',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 60,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
                                            child: Container(
                                              width: 140,
                                              height: 60,
                                              decoration: BoxDecoration(),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton1 = true);
                                                  try {
                                                    Navigator.pop(context);
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton1 =
                                                            false);
                                                  }
                                                },
                                                text: '戻る',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color:
                                                      FlutterFlowTheme.sLight,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Open Sans',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton1,
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<List<CategoriesRecord>>(
                                            stream: queryCategoriesRecord(
                                              queryBuilder:
                                                  (categoriesRecord) =>
                                                      categoriesRecord.where(
                                                          'cat_name',
                                                          isEqualTo:
                                                              widget.catName),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitPulse(
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CategoriesRecord>
                                                  containerCategoriesRecordList =
                                                  snapshot.data;
                                              // Return an empty Container when the document does not exist.
                                              if (snapshot.data.isEmpty) {
                                                return Container();
                                              }
                                              final containerCategoriesRecord =
                                                  containerCategoriesRecordList
                                                          .isNotEmpty
                                                      ? containerCategoriesRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                width: 140,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() =>
                                                        _loadingButton2 = true);
                                                    try {
                                                      aaa =
                                                          await registContentsCall(
                                                        catName: widget.catName,
                                                        catNameAdd:
                                                            widget.catNameAdd,
                                                        title: widget.title,
                                                        overview: functions
                                                            .getMultilineText(
                                                                widget
                                                                    .overview),
                                                        detail: functions
                                                            .getMultilineText(
                                                                widget.detail),
                                                        organizer:
                                                            widget.organizer,
                                                        contact: widget.contact,
                                                        homepage:
                                                            widget.homepage,
                                                        postName:
                                                            widget.postName,
                                                        postEmail:
                                                            widget.postEmail,
                                                        postPhone:
                                                            widget.postPhone,
                                                        postOccupation: widget
                                                            .postOccupation,
                                                        permission:
                                                            widget.permission,
                                                        address: widget.address,
                                                        startDay:
                                                            dateTimeFormat(
                                                                'yMMMd',
                                                                widget
                                                                    .startDay),
                                                        finalDay:
                                                            dateTimeFormat(
                                                                'yMMMd',
                                                                widget
                                                                    .finalDay),
                                                        postRemarks:
                                                            widget.postRemarks,
                                                        uid: currentUserUid,
                                                        filePath:
                                                            widget.filePath,
                                                      );
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text('送信完了'),
                                                            content: Text(
                                                                '投稿ありがとうございます。投稿内容を審査しますので、お待ち下さい。'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('OK'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      await Navigator
                                                          .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePageWidget(),
                                                        ),
                                                        (r) => false,
                                                      );

                                                      setState(() {});
                                                    } finally {
                                                      setState(() =>
                                                          _loadingButton2 =
                                                              false);
                                                    }
                                                  },
                                                  text: '送信',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                    textStyle: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Open Sans',
                                                      color: FlutterFlowTheme
                                                          .textLight,
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 12,
                                                  ),
                                                  loading: _loadingButton2,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
