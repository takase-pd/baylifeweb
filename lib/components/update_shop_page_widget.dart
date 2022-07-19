import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/update_transactions_law_page_widget.dart';
import '../custom_code/widgets/index.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class UpdateShopPageWidget extends StatefulWidget {
  const UpdateShopPageWidget({
    Key key,
    this.shop,
  }) : super(key: key);

  final ShopsRecord shop;

  @override
  _UpdateShopPageWidgetState createState() => _UpdateShopPageWidgetState();
}

class _UpdateShopPageWidgetState extends State<UpdateShopPageWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController9;
  TextEditingController textController10;
  TextEditingController textController11;
  TextEditingController textController12;
  TextEditingController textController13;
  TextEditingController textController14;
  DocumentReference catMainRef;
  DocumentReference comRef;
  DocumentReference directorRef;
  final formKey = GlobalKey<FormState>();

  static const NO_IMAGE =
      'https://firebasestorage.googleapis.com/v0/b/baylifedev.appspot.com/o/assets%2FNoImage.png?alt=media&token=16c12fc7-9de4-4531-9b81-c4b0e7a07945';
  Future<ShopsRecord> shop;
  List<CatShopRecord> catShops;
  List<String> catShopList;
  List<CompaniesRecord> companies;
  List<String> comNameList;
  String banner;
  bool isNew = true;
  int shippingFee = 0;
  int shippingFreeTotal = 0;
  String label = '追加';
  String alert = '';
  bool display = false;

  Future<ShopsRecord> _getShop() async {
    catShops = await queryCatShopRecordOnce();
    catShopList = catShops.map((e) => e.catName).toList();

    companies = await queryCompaniesRecordOnce(
      queryBuilder: (companiesRecord) =>
          companiesRecord.where('director', isEqualTo: currentUserReference),
    );
    comNameList = companies.map((e) => e.name).toList();
    comRef = companies
        .firstWhere((element) => element.name == comNameList.first)
        .reference;

    if (widget.shop == null) {
      banner = NO_IMAGE;
      return ShopsRecord();
    }

    isNew = false;
    final _shop = widget.shop;
    final catShop =
        catShops.firstWhere((element) => element.reference == _shop.catMain);
    textController2 = TextEditingController(text: catShop.catName);
    catMainRef = _shop.catMain;
    final company =
        companies.firstWhere((element) => element.reference == _shop.company);
    comRef = _shop.company;
    textController3 = TextEditingController(text: company.name);
    banner = _shop.banner;
    directorRef = _shop.director;
    shippingFee = _shop.shippingFee;
    shippingFreeTotal = _shop.shippingFreeTotal;
    label = '更新';
    textController6 = TextEditingController(text: _shop.internal);
    display = _shop.display;
    return _shop;
  }

  bool validateEmail(List<String> emails) {
    final validate = emails
        .where((email) => EmailValidator.validate(email) == false)
        .toList();
    return validate.isEmpty ? true : false;
  }

  @override
  void initState() {
    super.initState();
    shop = _getShop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: FutureBuilder<ShopsRecord>(
        future: shop,
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
                                  banner,
                                  width: 400,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController1 ??=
                                            TextEditingController(
                                          text: containerShopsRecord.shopName,
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ショップ名',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? 'ショップ名を入力してください。'
                                              : null;
                                        },
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: textController2 ??=
                                            TextEditingController(),
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ショップカテゴリ',
                                          isDense: true,
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
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? 'ショップカテゴリを選択してください。'
                                              : null;
                                        },
                                      ),
                                    ),
                                    FlutterFlowDropDown(
                                      options: catShopList,
                                      onChanged: (val) => setState(() => {
                                            catMainRef = catShops
                                                .firstWhere((element) =>
                                                    element.catName == val)
                                                .reference,
                                            textController2 =
                                                TextEditingController(text: val)
                                          }),
                                      width: 240,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: textController3 ??=
                                            TextEditingController(
                                                text: comNameList.first),
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '企業',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? '企業名を選択してください。'
                                              : null;
                                        },
                                      ),
                                    ),
                                    if (companies.length > 1)
                                      FlutterFlowDropDown(
                                        options: companies
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => setState(() => {
                                              comRef = companies
                                                  .firstWhere((element) =>
                                                      element.name == val)
                                                  .reference,
                                              textController3 =
                                                  TextEditingController(
                                                      text: val)
                                            }),
                                        width: 240,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              // height: 120,
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController4 ??=
                                            TextEditingController(
                                                text: containerShopsRecord
                                                    .description),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '説明・備考',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        minLines: 2,
                                        maxLines: 5,
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: textController5 ??=
                                            TextEditingController(text: banner),
                                        maxLines: 5,
                                        minLines: 1,
                                        keyboardType: TextInputType.multiline,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'バナー画像',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? 'バナー画像を選択してください。'
                                              : null;
                                        },
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
                                            setState(() => {
                                                  uploadedFileUrl =
                                                      downloadUrls.first,
                                                  textController5 =
                                                      TextEditingController(
                                                          text:
                                                              uploadedFileUrl),
                                                });
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
                                              color: Colors.white,
                                              fontFamily: 'Open Sans',
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController6,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '通知用メールアドレス',
                                          hintText:
                                              '注文受付時、ショップ内に通知するメール送信先（半角カンマ区切りで複数可）',
                                          hintMaxLines: 2,
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (val) {
                                          final emails = val
                                              .replaceAll(RegExp(r'\s+'), '')
                                              .split(',');
                                          return !validateEmail(emails)
                                              ? '正しいメールアドレスを入力してください。'
                                              : null;
                                        },
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
                              '送料設定',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController7 ??=
                                            CurrencyChecker.create(
                                                    shippingFee.toString())
                                                .controller,
                                        onChanged: (text) {
                                          final checker =
                                              CurrencyChecker.create(text);
                                          setState(() {
                                            textController7 =
                                                checker.controller;
                                            shippingFee = checker.currency;
                                          });
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '送料上限指定額（半角数字）',
                                          helperText:
                                              '送料の合計が指定額を超えた場合、送料をこの指定額とする。',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController8 ??=
                                            CurrencyChecker.create(
                                                    shippingFreeTotal
                                                        .toString())
                                                .controller,
                                        onChanged: (text) {
                                          final checker =
                                              CurrencyChecker.create(text);
                                          setState(() {
                                            textController8 =
                                                checker.controller;
                                            shippingFreeTotal =
                                                checker.currency;
                                          });
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '送料無料適用時の合計金額（半角数字））',
                                          helperText:
                                              '設定を上回る購入額の場合、送料無料を適用します。未設定の場合、送料無料は適用されません。',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController9 ??=
                                            TextEditingController(
                                                text:
                                                    containerShopsRecord.email),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'メールアドレス',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? 'メールアドレスを入力してください。'
                                              : null;
                                        },
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController10 ??=
                                            TextEditingController(
                                                text:
                                                    containerShopsRecord.phone),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '電話番号',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          errorStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (val) {
                                          return val == null || val.isEmpty
                                              ? '電話番号を入力してください。'
                                              : null;
                                        },
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
                                                  16, 0, 16, 8),
                                          child: TextFormField(
                                            controller: textController11 ??=
                                                TextEditingController(
                                                    text:
                                                        '$currentUserEmail $currentUserDisplayName'),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '管理者',
                                              isDense: true,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (val) {
                                              return val == null || val.isEmpty
                                                  ? '管理者名を入力してください。'
                                                  : null;
                                            },
                                          ),
                                        ),
                                      ),
                                      if (false)
                                        FlutterFlowDropDown(
                                          options: ['Option 1'],
                                          onChanged: (val) => setState(() => {
                                                directorRef =
                                                    currentUserReference,
                                                textController11 =
                                                    TextEditingController(
                                                        text: val)
                                              }),
                                          width: 240,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController12 ??=
                                            TextEditingController(
                                                text: containerShopsRecord
                                                    .instagram),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Instagram',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController13 ??=
                                            TextEditingController(
                                                text: containerShopsRecord
                                                    .twitter),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Twitter',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                          16, 0, 16, 8),
                                      child: TextFormField(
                                        controller: textController14 ??=
                                            TextEditingController(
                                                text: containerShopsRecord.web),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Web',
                                          isDense: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    alert,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'UPDATE_SHOP_PAGE_COMP_${label}_BTN_ON_TAP');
                                      if (!formKey.currentState.validate()) {
                                        setState(() {
                                          alert = '必要事項を入力してください。';
                                        });
                                        return;
                                      }
                                      setState(() {
                                        alert = '';
                                      });

                                      logFirebaseEvent('Button_Alert-Dialog');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('ショップ$label'),
                                                    content:
                                                        Text('ショップを$labelします。'),
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

                                        final shopsCreateData =
                                            createShopsRecordData(
                                          banner: valueOrDefault<String>(
                                            textController5.text,
                                            NO_IMAGE,
                                          ),
                                          catMain: catMainRef,
                                          company: comRef,
                                          description:
                                              textController4.text ?? '',
                                          display: display,
                                          email: textController9.text ?? '',
                                          instagram:
                                              textController12.text ?? '',
                                          phone: textController10.text ?? '',
                                          shopName: textController1.text ?? '',
                                          twitter: textController13.text ?? '',
                                          web: textController14.text ?? '',
                                          director: directorRef ??
                                              currentUserReference,
                                          shippingFee: shippingFee,
                                          shippingFreeTotal: shippingFreeTotal,
                                          internal: textController6.text
                                              .replaceAll(RegExp(r'\s+'), ''),
                                        );

                                        ShopsRecord _shop;
                                        if (isNew) {
                                          final path =
                                              ShopsRecord.collection.doc().path;
                                          final id =
                                              path.split('/').toList().last;
                                          await ShopsRecord.collection
                                              .doc(id)
                                              .set(shopsCreateData);
                                          _shop =
                                              await ShopsRecord.getDocumentOnce(
                                                  FirebaseFirestore.instance
                                                      .doc(path));
                                        } else {
                                          await containerShopsRecord.reference
                                              .update(shopsCreateData);
                                          _shop = containerShopsRecord;
                                        }

                                        final law =
                                            await TransactionsLaw.create(
                                                _shop.reference.path, context);

                                        logFirebaseEvent(
                                            'Button_Show-Snack-Bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'ショップを$labelしました。',
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
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.64,
                                          ),
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.94,
                                                child:
                                                    UpdateTransactionsLawPageWidget(
                                                  shopName: shopsCreateData[
                                                      'shop_name'],
                                                  law: law,
                                                  isNew: isNew,
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
                                    text: label,
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
