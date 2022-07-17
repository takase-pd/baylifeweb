import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateOrderPageWidget extends StatefulWidget {
  const UpdateOrderPageWidget({
    Key key,
    this.order,
  }) : super(key: key);

  final DocumentReference order;

  @override
  _UpdateOrderPageWidgetState createState() => _UpdateOrderPageWidgetState();
}

class _UpdateOrderPageWidgetState extends State<UpdateOrderPageWidget> {
  String carrierValue;
  bool indivSwitchValue;
  String dropDownValue;
  TextEditingController textController8;
  TextEditingController noteController;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  TextEditingController textController7;

  @override
  void initState() {
    super.initState();
    textController8 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OrdersRecord>(
      future: OrdersRecord.getDocumentOnce(widget.order),
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
        final containerOrdersRecord = snapshot.data;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            children: [
                              Text(
                                '注文詳細',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: textController1 ??=
                                              TextEditingController(
                                            text: dateTimeFormat(
                                                'yMMMd',
                                                containerOrdersRecord
                                                    .purchased),
                                          ),
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '注文日時',
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
                                              .bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController2 ??=
                                                TextEditingController(
                                              text: dateTimeFormat(
                                                  'yMMMd',
                                                  containerOrdersRecord
                                                      .updated),
                                            ),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '最終更新日時',
                                              hintText: '配送情報、ステータス、メモ更新',
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
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: textController3 ??=
                                              TextEditingController(
                                            text: formatNumber(
                                              containerOrdersRecord.totalAmount,
                                              formatType: FormatType.custom,
                                              currency: '￥',
                                              format: '#,##0',
                                              locale: 'ja_JP',
                                            ),
                                          ),
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '料金',
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
                                              .bodyText1,
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController4 ??=
                                                TextEditingController(
                                              text: containerOrdersRecord
                                                  .totalQuantity
                                                  .toString(),
                                            ),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '注文総数',
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
                                                .bodyText1,
                                            textAlign: TextAlign.end,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController5 ??=
                                                TextEditingController(
                                              text: formatNumber(
                                                containerOrdersRecord
                                                    .totalShippingFee,
                                                formatType: FormatType.custom,
                                                currency: '￥',
                                                format: '#,##0',
                                                locale: 'ja_JP',
                                              ),
                                            ),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '送料',
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
                                                .bodyText1,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetOrderDetailsCall.call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final textFieldGetOrderDetailsResponse =
                                                    snapshot.data;
                                                return TextFormField(
                                                  controller:
                                                      textController6 ??=
                                                          TextEditingController(
                                                    text: getJsonField(
                                                      (textFieldGetOrderDetailsResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$''',
                                                    ).toString(),
                                                  ),
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: '注文者',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: GetOrderDetailsCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final textFieldGetOrderDetailsResponse =
                                                snapshot.data;
                                            return TextFormField(
                                              controller: textController7 ??=
                                                  TextEditingController(
                                                text: getJsonField(
                                                  (textFieldGetOrderDetailsResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$''',
                                                ).toString(),
                                              ),
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: '配送先',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                          child: Text(
                            '注文商品',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 16),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: GetOrderedPlansCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitPulse(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewGetOrderedPlansResponse =
                                              snapshot.data;
                                          return ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Container(
                                                  height: 88,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 8, 8, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'No',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                'Name',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'total_amount',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'quantity',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'status',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Text(
                                                                'updated',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sLight,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                          child: Text(
                            '配送',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: SwitchListTile(
                                              value: indivSwitchValue ??= false,
                                              onChanged: (newValue) => setState(
                                                  () => indivSwitchValue =
                                                      newValue),
                                              title: Text(
                                                '商品別配送',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: FlutterFlowDropDown(
                                            options: ['Option 1'],
                                            onChanged: (val) => setState(
                                                () => carrierValue = val),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            hintText: '配送業者',
                                            fillColor: Colors.white,
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 8,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!(indivSwitchValue) ?? true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: TextFormField(
                                                controller: textController8,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'トラッキングコード',
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                            child: FlutterFlowDropDown(
                                              options: [
                                                '注文',
                                                '確認中',
                                                '発送済',
                                                '到着'
                                              ],
                                              onChanged: (val) => setState(
                                                  () => dropDownValue = val),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              hintText: 'ステータス',
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              elevation: 4,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(16, 4, 8, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: TextFormField(
                                              controller: noteController ??=
                                                  TextEditingController(
                                                text:
                                                    containerOrdersRecord.note,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'メモ',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        lineHeight: 1.48,
                                                      ),
                                              maxLines: 5,
                                              keyboardType:
                                                  TextInputType.multiline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '通知用',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'UPDATE_ORDER_PAGE_COMP_更新_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Alert-Dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('注文更新'),
                                                  content: Text('注文を更新します。'),
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

                                      final ordersUpdateData =
                                          createOrdersRecordData(
                                        note: noteController?.text ?? '',
                                        updated: getCurrentTimestamp,
                                      );
                                      await containerOrdersRecord.reference
                                          .update(ordersUpdateData);
                                      logFirebaseEvent('Button_Show-Snack-Bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '注文を更新しました。',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
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
                                        .bodyText1
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
    );
  }
}
