import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/update_transactions_law_page_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateShopPageWidget extends StatefulWidget {
  const UpdateShopPageWidget({
    Key key,
    this.shop,
  }) : super(key: key);

  final DocumentReference shop;

  @override
  _UpdateShopPageWidgetState createState() => _UpdateShopPageWidgetState();
}

class _UpdateShopPageWidgetState extends State<UpdateShopPageWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController5;
  String dropDownValue1;
  TextEditingController textController2;
  TextEditingController textController1;
  String dropDownValue2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController9;
  String dropDownValue3;
  TextEditingController textController10;
  TextEditingController textController11;
  TextEditingController textController12;
  TextEditingController textController13;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController(text: dropDownValue1);
    textController3 = TextEditingController(text: dropDownValue2);
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
    textController8 = TextEditingController();
    textController9 = TextEditingController();
    textController10 = TextEditingController();
    textController11 = TextEditingController();
    textController12 = TextEditingController();
    textController13 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: FutureBuilder<ShopsRecord>(
        future: ShopsRecord.getDocumentOnce(widget.shop),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final containerShopsRecord = snapshot.data;
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ショップ',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/baylifedev.appspot.com/o/assets%2FNoImage.png?alt=media&token=16c12fc7-9de4-4531-9b81-c4b0e7a07945',
                                  width: 200,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController1,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ショップ名',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: StreamBuilder<List<CatShopRecord>>(
                              stream: queryCatShopRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<CatShopRecord> containerCatShopRecordList =
                                    snapshot.data;
                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: textController2,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'ショップカテゴリ',
                                              hintText: 'Cat Shop Refを手動で貼り付け',
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        FlutterFlowDropDown(
                                          options: ['Option 1'],
                                          onChanged: (val) => setState(
                                              () => dropDownValue1 = val),
                                          width: 240,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          hintText: 'ショップカテゴリ名',
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: StreamBuilder<List<CompaniesRecord>>(
                              stream: queryCompaniesRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<CompaniesRecord>
                                    containerCompaniesRecordList =
                                    snapshot.data;
                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: textController3,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '企業',
                                              hintText: 'Comapnies Refを手動で貼り付け',
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        FlutterFlowDropDown(
                                          options: ['Option 1'],
                                          onChanged: (val) => setState(
                                              () => dropDownValue2 = val),
                                          width: 240,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          hintText: '企業名',
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController4,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '説明・備考',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        maxLines: 10,
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: textController5,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'バナー画像',
                                          hintText: 'ページ上部に抜粋画像が表示されます。',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'UPDATE_SHOP_PAGE_COMP_選択_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_Upload-Photo-Video');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          final downloadUrls =
                                              (await Future.wait(selectedMedia
                                                      .map((m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes))))
                                                  .where((u) => u != null)
                                                  .toList();
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          if (downloadUrls != null &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() => uploadedFileUrl =
                                                downloadUrls.first);
                                            showUploadMessage(
                                              context,
                                              'Success!',
                                            );
                                          } else {
                                            showUploadMessage(
                                              context,
                                              'Failed to upload media',
                                            );
                                            return;
                                          }
                                        }
                                      },
                                      text: '選択',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              '送料設定',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController6,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '送料上限',
                                          hintText:
                                              '送料の合計が指定額を超えた場合、送料をこの指定額とする。',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController7,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '送料無料適用時の合計金額',
                                          hintText:
                                              '設定を上回る購入額の場合、送料無料を適用します。未設定の場合、送料無料は適用されません。',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              '連絡先',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController8,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'メールアドレス',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController9,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '電話番号',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> containerUsersRecordList =
                                    snapshot.data;
                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).background,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController10,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '管理者',
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowDropDown(
                                        options: ['Option 1'],
                                        onChanged: (val) => setState(
                                            () => dropDownValue3 = val),
                                        width: 240,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'ユーザーID',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Text(
                              'メディア',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController11,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Instagram',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController12,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Twitter',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController13,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Web',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'XXXXXXは手動で設定する必要があります。',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'UPDATE_SHOP_PAGE_COMP_更新_BTN_ON_TAP');
                                      logFirebaseEvent('Button_Alert-Dialog');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('ショップ追加'),
                                                    content:
                                                        Text('ショップを追加します。'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        logFirebaseEvent('Button_Backend-Call');

                                        final shopsUpdateData =
                                            createShopsRecordData();
                                        await containerShopsRecord.reference
                                            .update(shopsUpdateData);
                                        logFirebaseEvent(
                                            'Button_Show-Snack-Bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'ショップを追加しました。',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        logFirebaseEvent('Button_Bottom-Sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x8E484848),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.96,
                                                child:
                                                    UpdateTransactionsLawPageWidget(
                                                  shop: widget.shop,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        return;
                                      } else {
                                        return;
                                      }
                                    },
                                    text: '更新',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 60,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .textLight,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
