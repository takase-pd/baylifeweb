import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../custom_code/widgets/index.dart';
import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTransactionsLawPageWidget extends StatefulWidget {
  const UpdateTransactionsLawPageWidget({
    Key key,
    this.shop,
    this.law,
    this.isNew,
  }) : super(key: key);

  final ShopsRecord shop;
  final TransactionsLaw law;
  final bool isNew;

  @override
  _UpdateTransactionsLawPageWidgetState createState() =>
      _UpdateTransactionsLawPageWidgetState();
}

class _UpdateTransactionsLawPageWidgetState
    extends State<UpdateTransactionsLawPageWidget> {
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
  final formKey = GlobalKey<FormState>();

  String label = '';
  String alert = '';

  @override
  void initState() {
    super.initState();
    textController8 = TextEditingController(text: '商品紹介ページをご参照ください。');
    textController11 = TextEditingController(text: 'Bay Lifeアプリの決済方法に準じます。');
    widget.isNew ? label = '作成' : label = '更新';
  }

  @override
  Widget build(BuildContext context) {
    final law = widget.law;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '特定商取引法に基づく表記',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.shop.shopName,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            text: law.company),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '販売業者',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    maxLines: 1,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '販売業者名（企業名など）を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                    controller: textController2 ??=
                                        TextEditingController(
                                            text: law.director),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '代表責任者',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '代表責任者名を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 8),
                                  child: TextFormField(
                                    controller: textController3 ??=
                                        TextEditingController(
                                            text: law.postalCode),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '郵便番号',
                                      hintText: 'ハイフンなし',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.number,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '郵便番号を入力してください。'
                                          : null;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 8),
                                  child: TextFormField(
                                    controller: textController4 ??=
                                        TextEditingController(
                                            text: law.address),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '住所',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.streetAddress,
                                    minLines: 1,
                                    maxLines: 2,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '住所を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                    controller: textController5 ??=
                                        TextEditingController(text: law.phone),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '電話番号',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    maxLines: 1,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                    controller: textController6 ??=
                                        TextEditingController(text: law.email),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'メールアドレス',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                        TextEditingController(text: law.web),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'ホームページURL',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.url,
                                    maxLines: 1,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? 'ホームページURLを入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                        TextEditingController(
                                            text: law.unitAmount),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '販売価格',
                                      hintText: '商品紹介ページをご参照ください。など',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '販売価格を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            text: law.otherFees),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '商品代金以外の必要料金',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 5,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '商品代金以外の必要料金を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            text: law.delvTime),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '引き渡し時期',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 5,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '引き渡し時期を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                    controller: textController11 ??=
                                        TextEditingController(
                                            text: law.paymentMethod),
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'お支払い方法',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 2,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? 'お支払い方法を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                        TextEditingController(text: law.rec),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '返品・交換・キャンセル等',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 5,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '返品・交換・キャンセル等を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            text: law.returnPeriod),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '返品期限',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 5,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '返品期限を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                            text: law.returnCharge),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: '返品送料',
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      errorStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    minLines: 1,
                                    maxLines: 2,
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (val) {
                                      return val.isEmpty
                                          ? '返品送料を入力してください。'
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                      'UPDATE_TRANSACTIONS_LAW_${label}_BTN_ON_TAP');
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
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(label),
                                            content:
                                                Text('特定商取引法に基づく表記を$labelします。'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_Backend-Call');
                                    final _appCheckToken =
                                        await AppCheckAgent.getToken(context);
                                    await UpdateTransactionsLawCall.call(
                                      shopPath: law.path,
                                      uid: currentUserUid,
                                      address: textController4.text,
                                      company: textController1.text,
                                      delvTime: getMultilineText(
                                          textController10.text),
                                      director: textController2.text,
                                      email: textController6.text,
                                      otherFees: getMultilineText(
                                          textController9.text),
                                      paymentMethod: getMultilineText(
                                          textController11.text),
                                      phone: textController5.text,
                                      postalCode: textController3.text,
                                      rec: getMultilineText(
                                          textController12.text),
                                      returnCharge: getMultilineText(
                                          textController14.text),
                                      returnPeriod: getMultilineText(
                                          textController13.text),
                                      unitAmount: textController8.text,
                                      web: textController7.text,
                                      accessToken: currentJwtToken,
                                      appCheckToken: _appCheckToken,
                                    );
                                    logFirebaseEvent('Button_Show-Snack-Bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ショップを$labelしました。',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    logFirebaseEvent('Button_Navigate-Back');
                                    int count = 0;
                                    Navigator.popUntil(
                                        context, (_) => count++ >= 2);
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
                                  borderRadius: 12,
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
      ),
    );
  }
}
