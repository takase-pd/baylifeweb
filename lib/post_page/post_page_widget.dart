import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/header_widget.dart';
import '../components/main_menu_widget.dart';
import '../confirm_page/confirm_page_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../plan_page/plan_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPageWidget extends StatefulWidget {
  PostPageWidget({
    Key key,
    this.subscription,
  }) : super(key: key);

  final String subscription;

  @override
  _PostPageWidgetState createState() => _PostPageWidgetState();
}

class _PostPageWidgetState extends State<PostPageWidget> {
  DateTime datePicked1;
  bool _loadingButton2 = false;
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  String uploadedFileUrl = '';
  bool _loadingButton1 = false;
  TextEditingController textController5;
  DateTime datePicked2;
  bool _loadingButton3 = false;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController10;
  TextEditingController textController9;
  TextEditingController textController11;
  TextEditingController textController12;
  TextEditingController textController13;
  bool _loadingButton4 = false;
  bool checkboxListTileValue;
  dynamic plans;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
    textController8 = TextEditingController();
    textController10 = TextEditingController(text: currentUserEmail);
    textController9 = TextEditingController(text: currentUserDisplayName);
    textController11 = TextEditingController();
    textController12 = TextEditingController();
    textController13 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: (widget.subscription) == ('empty'),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '投稿',
                              style: FlutterFlowTheme.title1,
                            ),
                            Text(
                              '投稿契約がありません。',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                            InkWell(
                              onTap: () async {
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
                              },
                              child: Text(
                                'こちらよりプランをお申込みください。',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: (widget.subscription) != ('empty'),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '投稿',
                                  style: FlutterFlowTheme.title1,
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
                                          child: CircularProgressIndicator(
                                            color:
                                                FlutterFlowTheme.primaryColor,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '投稿内容',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '投稿に表示されます。機密情報などは記載しないでください。',
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child:
                                              StreamBuilder<List<CatDdRecord>>(
                                            stream: queryCatDdRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CatDdRecord>
                                                  dropDownCatDdRecordList =
                                                  snapshot.data;
                                              // Return an empty Container when the document does not exist.
                                              if (snapshot.data.isEmpty) {
                                                return Container();
                                              }
                                              final dropDownCatDdRecord =
                                                  dropDownCatDdRecordList
                                                          .isNotEmpty
                                                      ? dropDownCatDdRecordList
                                                          .first
                                                      : null;
                                              return FlutterFlowDropDown(
                                                options: dropDownCatDdRecord
                                                    .cats
                                                    .toList(),
                                                onChanged: (val) => setState(
                                                    () => dropDownValue = val),
                                                width: 130,
                                                height: 40,
                                                textStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                ),
                                                fillColor: Colors.white,
                                                elevation: 2,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0,
                                                borderRadius: 0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(8, 4, 8, 4),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController1,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'その他の希望カテゴリー',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController2,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'タイトル',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return 'タイトルを入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController3,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '概要＊投稿一覧ページに表示されます。',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 10,
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return '概要を入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 330,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController4,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '投稿詳細',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 30,
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return '投稿詳細を入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '添付画像 300X300px以内',
                                                    style: FlutterFlowTheme
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 3, 0, 0),
                                                    child: Text(
                                                      '画像は次のページで確認できます。',
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton1 = true);
                                                  try {
                                                    final selectedMedia =
                                                        await selectMedia(
                                                      maxWidth: 300.00,
                                                      maxHeight: 300.00,
                                                      mediaSource: MediaSource
                                                          .photoGallery,
                                                    );
                                                    if (selectedMedia != null &&
                                                        validateFileFormat(
                                                            selectedMedia
                                                                .storagePath,
                                                            context)) {
                                                      showUploadMessage(context,
                                                          'Uploading file...',
                                                          showLoading: true);
                                                      final downloadUrl =
                                                          await uploadData(
                                                              selectedMedia
                                                                  .storagePath,
                                                              selectedMedia
                                                                  .bytes);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      if (downloadUrl != null) {
                                                        setState(() =>
                                                            uploadedFileUrl =
                                                                downloadUrl);
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload media');
                                                        return;
                                                      }
                                                    }
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton1 =
                                                            false);
                                                  }
                                                },
                                                text: '選択',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .secondaryDark,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton1,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController5,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '開催場所',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return '住所を入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Text(
                                                      '開始日',
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'yMMMd', datePicked1),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton2 = true);
                                                  try {
                                                    await DatePicker
                                                        .showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      onConfirm: (date) {
                                                        setState(() =>
                                                            datePicked1 = date);
                                                      },
                                                      currentTime:
                                                          getCurrentTimestamp,
                                                    );
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton2 =
                                                            false);
                                                  }
                                                },
                                                text: '日付',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .secondaryDark,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton2,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Text(
                                                      '終了日',
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'yMMMd', datePicked2),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton3 = true);
                                                  try {
                                                    await DatePicker
                                                        .showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      onConfirm: (date) {
                                                        setState(() =>
                                                            datePicked2 = date);
                                                      },
                                                      currentTime:
                                                          getCurrentTimestamp,
                                                    );
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton3 =
                                                            false);
                                                  }
                                                },
                                                text: '日付',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .secondaryDark,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton3,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController6,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '主催',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return '主催者名を入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController7,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '問い合わせ先（担当者名・部署など）',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return '問い合わせ先を入力してください。';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController8,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'ホームページ',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            keyboardType: TextInputType.url,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '投稿者情報',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '投稿には表示されません。管理者が投稿の確認、連絡などに使用します。',
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child: TextFormField(
                                              controller: textController9,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child: TextFormField(
                                              controller: textController10,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController11,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '電話番号',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController12,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '所属',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController13,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '備考',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText2
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFF8B97A2),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8B97A2),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 10,
                                            keyboardType:
                                                TextInputType.multiline,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await launchURL(
                                        'https://baylife-ff782.web.app/terms.html');
                                  },
                                  child: Text(
                                    '＊利用規約に従い投稿します。',
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
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
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                        ),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue ??=
                                              false,
                                          onChanged: (newValue) => setState(
                                              () => checkboxListTileValue =
                                                  newValue),
                                          title: Text(
                                            '上記内容に同意',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                          tileColor: FlutterFlowTheme.grayLight,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 12),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.grayLight,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton4 = true);
                                                try {
                                                  if (!formKey.currentState
                                                      .validate()) {
                                                    return;
                                                  }
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ConfirmPageWidget(
                                                        catName: dropDownValue,
                                                        catNameAdd:
                                                            textController1
                                                                .text,
                                                        title: textController2
                                                            .text,
                                                        overview:
                                                            textController3
                                                                .text,
                                                        detail: textController4
                                                            .text,
                                                        startDay: datePicked1,
                                                        finalDay: datePicked2,
                                                        address: textController5
                                                            .text,
                                                        organizer:
                                                            textController6
                                                                .text,
                                                        contact: textController7
                                                            .text,
                                                        homepage:
                                                            textController8
                                                                .text,
                                                        permission:
                                                            checkboxListTileValue,
                                                        postName:
                                                            textController9
                                                                .text,
                                                        postEmail:
                                                            textController10
                                                                .text,
                                                        postPhone:
                                                            textController11
                                                                .text,
                                                        postOccupation:
                                                            textController12
                                                                .text,
                                                        postRemarks:
                                                            textController13
                                                                .text,
                                                        filePath:
                                                            valueOrDefault<
                                                                String>(
                                                          uploadedFileUrl,
                                                          'https://firebasestorage.googleapis.com/v0/b/baylife-ff782.appspot.com/o/assets%2FNoImage.png?alt=media&token=cfb3d70b-69d2-4f7f-be63-f429cc9872da',
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton4 = false);
                                                }
                                              },
                                              text: '確認',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 60,
                                                color: FlutterFlowTheme
                                                    .secondaryDark,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                              loading: _loadingButton4,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
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
      ),
    );
  }
}
