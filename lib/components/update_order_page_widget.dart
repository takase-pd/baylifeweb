import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart';
import '../auth/firebase_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;

import 'package:bay_life_web/custom_code/widgets/ecommerce.dart';

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
  String dropDownValue1;
  bool switchListTileValue;
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
  Future<ShopsRecord> shop;
  Future<SoldRecord> order;
  Future<OrderDetails> details;
  Future<List<OrderedPlan>> plans;
  Future<List<ShippinStatusForm>> statusHandler;
  List<ShippinStatusForm> statusForms;
  // String carrier;
  List<String> trackingNumbers;

  Future<OrderDetails> _getOrderDetails() async {
    OrderDetails _details;

    final _shop = await shop;
    if (_shop == null) return _details;

    if (!currentUser.loggedIn) return _details;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return _details;

    final apiCallOutput = await GetOrderDetailsCall.call(
      shop: _shop.reference.path,
      uid: currentUserUid,
      paymentId: widget.order.id,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    final success = _apiJson['success'] ?? false;
    if (!success) {
      String errorMessage = _apiJson['error'] ?? '原因不明のエラーが発生';
      showSnackbar(
        context,
        'Error: $errorMessage',
      );
      return _details;
    }
    _details = OrderDetails(
      paymentId: _apiJson['details']['paymentId'],
      billing: stripe.BillingDetails(
        address: stripe.Address(
          country: _apiJson['details']['billing']['address']['country'],
          state: _apiJson['details']['billing']['address']['state'],
          city: _apiJson['details']['billing']['address']['city'],
          line1: _apiJson['details']['billing']['address']['line1'],
          line2: _apiJson['details']['billing']['address']['line2'],
          postalCode: _apiJson['details']['billing']['address']['postal_code'],
        ),
        name: _apiJson['details']['billing']['name'],
        phone: _apiJson['details']['billing']['phone'],
        email: _apiJson['details']['billing']['email'],
      ),
      shipping: stripe.ShippingDetails(
        address: stripe.Address(
          country: _apiJson['details']['shipping']['address']['country'],
          state: _apiJson['details']['shipping']['address']['state'],
          city: _apiJson['details']['shipping']['address']['city'],
          line1: _apiJson['details']['shipping']['address']['line1'],
          line2: _apiJson['details']['shipping']['address']['line2'],
          postalCode: _apiJson['details']['shipping']['address']['postal_code'],
        ),
        name: _apiJson['details']['shipping']['name'],
        phone: _apiJson['details']['shipping']['phone'],
        // carrier: _apiJson['details']['shipping']['carrier'],
        trackingNumber: _apiJson['details']['shipping']['tracking_number'],
      ),
    );

    // carrier = _details.shipping.carrier ?? '';
    trackingNumbers = _details.shipping.trackingNumber?.split(',') ?? [];

    return _details;
  }

  Future<List<OrderedPlan>> _getOrderedPlans() async {
    List<OrderedPlan> _plans = [];

    final _shop = await shop;
    if (_shop == null) return _plans;

    if (!currentUser.loggedIn) return _plans;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return _plans;

    final apiCallOutput = await GetOrderedPlansCall.call(
      shop: _shop.reference.path,
      uid: currentUserUid,
      paymentId: widget.order.id,
      accessToken: currentJwtToken,
      appCheckToken: _appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    final success = _apiJson['success'] ?? false;
    if (!success) {
      String errorMessage = _apiJson['error'] ?? '原因不明のエラーが発生';
      showSnackbar(
        context,
        'Error: $errorMessage',
      );
      return _plans;
    }
    _apiJson['plans'].forEach((plan) {
      _plans.add(OrderedPlan(
        path: plan['path'],
        unitAmount: plan['unit_amount'],
        quantity: plan['quantity'],
        name: plan['name'],
        status: ShippingStatusExt.getStatus(plan['status']),
        trackingIndex: plan['tracking_index'],
        updated: Timestamp(
          plan['updated']['_seconds'],
          plan['updated']['_nanoseconds'],
        ).toDate(),
      ));
    });

    return _plans;
  }

  Future<ShopsRecord> _getShop() async {
    ShopsRecord _shop;
    final containerShopsRecordList = await queryShopsRecordOnce(
      queryBuilder: (shopsRecord) =>
          shopsRecord.where('director', isEqualTo: currentUserReference),
      singleRecord: true,
    );
    // Return an empty Container when the document does not exist.
    if (containerShopsRecordList.isNotEmpty)
      _shop = containerShopsRecordList.isNotEmpty
          ? containerShopsRecordList.first
          : null;
    return _shop;
  }

  Future<SoldRecord> _getOrder() async {
    return SoldRecord.getDocumentOnce(widget.order);
  }

  Future<List<ShippinStatusForm>> _setShippingStatusForm() async {
    final _order = await order;
    final _plans = await plans;
    List<ShippinStatusForm> _statusHandler = [];
    switchListTileValue
        ? _plans.forEach(
            (_plan) async => _statusHandler.add(
              ShippinStatusForm.create(
                _plan.id,
                _plan.name,
                await _getTrackingNumber(_plan.trackingIndex),
                _plan.status,
              ),
            ),
          )
        : _statusHandler.add(
            ShippinStatusForm.create(
              widget.order.id.substring(3),
              '',
              await _getTrackingNumber(0),
              ShippingStatusExt.getStatus(_order.status),
            ),
          );

    statusForms = _statusHandler;
    return _statusHandler;
  }

  Future<String> _getTrackingNumber(int index) async {
    await details;
    if (trackingNumbers.length == 0) return '';
    return trackingNumbers[index];
  }

  @override
  void initState() {
    super.initState();
    switchListTileValue = false;
    textController9 = TextEditingController();
    shop = _getShop();
    order = _getOrder();
    details = _getOrderDetails();
    plans = _getOrderedPlans();
    statusHandler = _setShippingStatusForm();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SoldRecord>(
      future: order,
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
        final _order = snapshot.data;
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
                                      0, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController1 ??=
                                                TextEditingController(
                                              text: dateTimeFormat(
                                                  'MMM d, y h:mm a',
                                                  _order.purchased),
                                            ),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '注文日時',
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
                                                  'MMM d, y h:mm a',
                                                  _order.updated),
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
                                      0, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController3 ??=
                                                TextEditingController(
                                              text: formatNumber(
                                                _order.totalAmount,
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
                                            controller: textController4 ??=
                                                TextEditingController(
                                              text: _order.totalQuantity
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
                                                  16, 0, 16, 0),
                                          child: TextFormField(
                                            controller: textController5 ??=
                                                TextEditingController(
                                              text: formatNumber(
                                                _order.totalShippingFee,
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: FutureBuilder<OrderDetails>(
                                            future: details,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done) {
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
                                              final _details = snapshot.data;
                                              return TextFormField(
                                                controller: textController6 ??=
                                                    TextEditingController(
                                                  text: _details.billing.name,
                                                ),
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: '注文者',
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: FutureBuilder<OrderDetails>(
                                            future: details,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done) {
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
                                              final _details = snapshot.data;
                                              return TextFormField(
                                                controller: textController7 ??=
                                                    TextEditingController(
                                                  text: _details.shipping.name,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController8 ??=
                                                TextEditingController(
                                              text: _order.status,
                                            ),
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'ステータス',
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
                              ],
                            ),
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
                                      16, 0, 0, 8),
                                  child: Text(
                                    '注文商品',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: FutureBuilder<List<OrderedPlan>>(
                                        future: plans,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
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
                                          final _plans = snapshot.data;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: _plans.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final _plan =
                                                  _plans[listViewIndex];
                                              return Padding(
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
                                                                16, 8, 8, 8),
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
                                                                (listViewIndex +
                                                                        1)
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                _plan.name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                formatNumber(
                                                                  _plan
                                                                      .subtotal,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  currency: '￥',
                                                                  format:
                                                                      '#,##0',
                                                                  locale:
                                                                      'ja_JP',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                _plan.quantity
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: FaIcon(
                                                                _plan.status
                                                                    .icon,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                size: _plan
                                                                    .status
                                                                    .size,
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
                                                                dateTimeFormat(
                                                                    'MMM d, y h:mm a',
                                                                    _plan
                                                                        .updated),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sLight,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FutureBuilder<List<OrderedPlan>>(
                              future: plans,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
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
                                final _plans = snapshot.data;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 8),
                                      child: Text(
                                        '配送',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowDropDown(
                                              options: [
                                                'クロネコヤマト',
                                                '佐川急便',
                                                '日本郵便',
                                              ].toList(),
                                              // ShippingCarrierExt.labelList,
                                              onChanged: (val) => setState(
                                                  () => dropDownValue1 = val),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              hintText: '配送業者',
                                              fillColor: Colors.white,
                                              elevation: 2,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0,
                                              borderRadius: 0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(16, 4, 16, 4),
                                              hidesUnderline: true,
                                              // initialOption: carrier,
                                            ),
                                          ),
                                          // if (_plans.length > 1)
                                          Expanded(
                                            flex: 3,
                                            child: SwitchListTile(
                                              value: switchListTileValue ??=
                                                  false,
                                              onChanged: (newValue) =>
                                                  setState(() => {
                                                        switchListTileValue =
                                                            newValue,
                                                        statusHandler =
                                                            _setShippingStatusForm(),
                                                      }),
                                              title: Text(
                                                '商品別配送指定',
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
                                        ],
                                      ),
                                    ),
                                    FutureBuilder<List<ShippinStatusForm>>(
                                      future: statusHandler,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (snapshot.connectionState !=
                                            ConnectionState.done) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        // final _statusForms = snapshot.data;
                                        return ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            ...statusForms.map(
                                              (_form) => Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (switchListTileValue)
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: TextFormField(
                                                          controller:
                                                              TextEditingController(
                                                                  text: _form
                                                                      .planName),
                                                          readOnly: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: '商品名',
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 0, 0),
                                                      child: TextFormField(
                                                        controller:
                                                            _form.controller,
                                                        onChanged: (text) => {
                                                          setState(
                                                            () => statusForms = statusForms
                                                                .map((e) => e
                                                                            .id ==
                                                                        _form.id
                                                                    ? _form
                                                                        .changeTrackingNumber(
                                                                            text)
                                                                    : e)
                                                                .toList(),
                                                          ),
                                                        },
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'トラッキングコード',
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 8, 0),
                                                      child:
                                                          FlutterFlowDropDown(
                                                        options:
                                                            ShippingStatusExt
                                                                .labelList,
                                                        onChanged: (val) =>
                                                            setState(
                                                          () => statusForms = statusForms
                                                              .map((e) => e
                                                                          .id ==
                                                                      _form.id
                                                                  ? _form.changeStatus(
                                                                      ShippingStatusExt
                                                                          .getStatus(
                                                                              val))
                                                                  : e)
                                                              .toList(),
                                                        ),
                                                        width: 128,
                                                        height: 32,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                        hintText: 'ステータス',
                                                        fillColor: Colors.white,
                                                        elevation: 4,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0,
                                                        borderRadius: 0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 4,
                                                                    8, 4),
                                                        hidesUnderline: true,
                                                        initialOption:
                                                            _form.status.label,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textController10 ??=
                                                          TextEditingController(
                                                    text: _order.note,
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'メモ',
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
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        lineHeight: 1.48,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    final _shop = await shop;
                                    if (_shop == null) {
                                      String errorMessage = '原因不明のエラーが発生';
                                      showSnackbar(
                                        context,
                                        'Error: $errorMessage',
                                      );
                                      return;
                                    }

                                    logFirebaseEvent('Button_ON_TAP');
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
                                      Map<String, int> box = {};
                                      List numbers = [];
                                      for (var i = 0;
                                          i < statusForms.length;
                                          i++) {
                                        if (statusForms[i].trackingNumber ==
                                                '' ||
                                            statusForms[i].trackingNumber ==
                                                null) continue;
                                        box[statusForms[i].id] = i;
                                        numbers
                                            .add(statusForms[i].trackingNumber);
                                      }

                                      final _numbers = numbers.reduce(
                                          (value, element) =>
                                              value + ',' + element);

                                      final _appCheckToken =
                                          await AppCheckAgent.getToken(context);
                                      if (!switchListTileValue) {
                                        final _status =
                                            statusForms[0].status.name;
                                        final soldUpdateData =
                                            createSoldRecordData(
                                          status: _status,
                                          note: textController10?.text ?? '',
                                          updated: getCurrentTimestamp,
                                        );
                                        await widget.order
                                            .update(soldUpdateData);
                                      } else {
                                        final tmpUpdate = statusForms
                                            .map(
                                              (e) => '''{
                                              "id": "${e.id}",
                                              "index": ${box[e.id]},
                                              "status": "${e.status.name}"
                                              },''',
                                            )
                                            .fold(
                                                '[',
                                                (previousValue, element) =>
                                                    previousValue + element);
                                        final updateOrders =
                                            tmpUpdate.substring(
                                                    0, tmpUpdate.length - 1) +
                                                ']';
                                        final apiCallOutput =
                                            await UpdateOrderedPlanCall.call(
                                          shop: _shop.reference.path,
                                          uid: currentUserUid,
                                          paymentId: widget.order.id,
                                          orders: updateOrders,
                                          updated:
                                              getCurrentTimestamp.toString(),
                                          accessToken: currentJwtToken,
                                          appCheckToken: _appCheckToken,
                                        );
                                      }
                                      final apiCallOutput =
                                          await UpdateDeliveryServiceCall.call(
                                        shop: _shop.reference.path,
                                        uid: currentUserUid,
                                        paymentId: widget.order.id,
                                        carrier: dropDownValue1,
                                        trackingNumber: _numbers,
                                        accessToken: currentJwtToken,
                                        appCheckToken: _appCheckToken,
                                      );

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
        );
      },
    );
  }
}
