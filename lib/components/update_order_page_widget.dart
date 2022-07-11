import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateOrderPageWidget extends StatefulWidget {
  const UpdateOrderPageWidget({
    Key key,
    this.order,
  }) : super(key: key);

  final OrdersRecord order;

  @override
  _UpdateOrderPageWidgetState createState() => _UpdateOrderPageWidgetState();
}

class _UpdateOrderPageWidgetState extends State<UpdateOrderPageWidget> {
  String carrierValue;
  bool indivSwitchValue = false;
  TextEditingController noteController;
  TextEditingController textController1; // odered date
  TextEditingController textController2; // updated date
  TextEditingController textController3; // unit amount
  TextEditingController textController4; // quantity
  TextEditingController textController5; // shipping fee
  TextEditingController textController6; // ordered name
  TextEditingController textController7; // shipping info
  TextEditingController textController8; // status

  OrdersRecord order;
  Future<OrderDetails> details;
  Future<List<OrderedPlan>> plans;
  Future<List<ShippingForm>> shippingHandler;
  List<ShippingForm> shippingForms;
  String paymentId;
  String shopPath;
  String carrier;
  List<String> trackingNumbers;
  bool switchHanler = false;
  String alert = '配送情報を入力ください。追跡番号がない場合、空欄のまま更新してください。';

  Future<List<ShippingForm>> _setForm() async {
    final _details = await details;
    final _plans = await plans;
    carrier = _details.carrier;
    carrierValue = carrier ?? '';
    trackingNumbers = _details.trackingNumbers;
    if (!switchHanler) indivSwitchValue = order.indivShipping ?? false;
    shippingForms = ShippingForm.createForm(
        order, _plans, _details, indivSwitchValue, paymentId);
    return shippingForms;
  }

  bool _validateForm() {
    bool validate = true;
    String message = '次の設定を確認してください。';
    final status = _orderStatus();

    switch (status) {
      case ShippingStatus.ordered:
      case ShippingStatus.confirming:
        break;
      case ShippingStatus.shipping:
      case ShippingStatus.shipped:
        if (carrierValue == null || carrierValue == '') {
          message += '\n・配送業者が選択されていません。';
          validate = false;
        }
        break;
    }

    setState(() {
      if (!validate) alert = message;
    });
    return validate;
  }

  ShippingStatus _orderStatus() {
    if (!indivSwitchValue) return shippingForms[0].status;

    final status = shippingForms.map((e) => e.status);
    if (status.contains(ShippingStatus.confirming))
      return ShippingStatus.confirming;
    if (status.contains(ShippingStatus.shipping))
      return ShippingStatus.shipping;
    if (status.contains(ShippingStatus.shipped)) return ShippingStatus.shipped;

    return ShippingStatus.ordered;
  }

  Future<String> _setOrders() async {
    final _plans = await plans;
    final ordersReq = indivSwitchValue
        ? shippingForms
            .map<String>(
              (e) => '''{
                "id": "${e.id}",
                "index": ${e.trackingIndex},
                "status": "${e.status.label}"
                },''',
            )
            .toList()
        : _plans
            .map<String>(
              (e) => '''{
                "id": "${e.id}",
                "index": ${shippingForms[0].trackingIndex},
                "status": "${shippingForms[0].status.label}"
                },''',
            )
            .toList();
    final orders = ordersReq.fold<String>(
        '[', (previousValue, element) => previousValue + element);
    return orders.substring(0, orders.length - 1) + ']';
  }

  @override
  void initState() {
    super.initState();
    order = widget.order;
    paymentId = order.reference.id;
    final tmpPath = order.reference.path.split('/');
    shopPath = '${tmpPath[0]}/${tmpPath[1]}';
    details = OrderDetails.create(shopPath, paymentId, context);
    plans = OrderedPlan.create(shopPath, paymentId, context);
    shippingHandler = _setForm();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      controller: textController1 ??=
                                          TextEditingController(
                                        text: dateTimeFormat(
                                            'MMM d, y h:mm a', order.purchased),
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController2 ??=
                                            TextEditingController(
                                          text: dateTimeFormat(
                                              'MMM d, y h:mm a', order.updated),
                                        ),
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '最終更新日時',
                                          hintText: '配送情報、ステータス、メモ更新',
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
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      controller: textController3 ??=
                                          CurrencyChecker.create(
                                                  order.totalAmount.toString())
                                              .controller,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '料金',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          88, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController4 ??=
                                            TextEditingController(
                                          text: order.totalQuantity.toString(),
                                        ),
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '注文総数',
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
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          88, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController5 ??=
                                            CurrencyChecker.create(order
                                                    .totalShippingFee
                                                    .toString())
                                                .controller,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '送料',
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final _details = snapshot.data;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'UPDATE_ORDER_Text_ShippingInfo_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_Alert-Dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('配送先'),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Text(
                                                                  _details
                                                                      .shipping
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      _details
                                                                          .shipping
                                                                          .address
                                                                          .postalCode,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        _details.billing.address.state +
                                                                            _details.shipping.address.city +
                                                                            _details.shipping.address.line1 +
                                                                            _details.shipping.address.line2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                _details
                                                                    .shipping
                                                                    .phone,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('OK'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    '配送先情報を表示',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'UPDATE_ORDER_Text_OrderInfo_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_Alert-Dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('注文者'),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Text(
                                                                    _details
                                                                        .billing
                                                                        .name),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      _details
                                                                          .billing
                                                                          .address
                                                                          .postalCode,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        _details.billing.address.state +
                                                                            _details.billing.address.city +
                                                                            _details.billing.address.line1 +
                                                                            _details.billing.address.line2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Text(
                                                                    _details
                                                                        .billing
                                                                        .phone),
                                                              ),
                                                              Text(
                                                                _details.billing
                                                                    .email,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('OK'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    '注文者情報を表示',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        itemBuilder: (context, listViewIndex) {
                                          final _plan = _plans[listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Container(
                                              height: 88,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .background,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 8, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                            (listViewIndex + 1)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            _plan.name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            CurrencyChecker
                                                                    .create(_plan
                                                                        .subtotal
                                                                        .toString())
                                                                .formated,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Text(
                                                            _plan.quantity
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'MMM d, y h:mm a',
                                                                _plan.updated),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sLight,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: FaIcon(
                                                            _plan.status.icon,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            size: _plan
                                                                .status.size,
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
                        child: FutureBuilder<List<ShippingForm>>(
                          future: shippingHandler,
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
                            // final _plans = snapshot.data;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // if (_plans.length > 1)
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
                                              onChanged: (newValue) =>
                                                  setState(() => {
                                                        indivSwitchValue =
                                                            newValue,
                                                        switchHanler = true,
                                                        shippingHandler =
                                                            _setForm(),
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
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: FlutterFlowDropDown(
                                            options:
                                                ShippingCarrierExt.labelList,
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
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 4),
                                            hidesUnderline: true,
                                            initialOption: carrier,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    ...shippingForms.map(
                                      (_form) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (indivSwitchValue)
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                            text:
                                                                _form.planName),
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: '商品名',
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(9, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        _form.controller,
                                                    onChanged: (text) => {
                                                      setState(
                                                        () => shippingForms =
                                                            shippingForms
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
                                                    decoration: InputDecoration(
                                                      labelText: '追跡番号',
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: FlutterFlowDropDown(
                                                  options: ShippingStatusExt
                                                      .labelList,
                                                  onChanged: (val) => setState(
                                                    () => shippingForms = shippingForms
                                                        .map((e) => e.id ==
                                                                _form.id
                                                            ? _form.changeStatus(
                                                                ShippingStatusExt
                                                                    .create(
                                                                        val))
                                                            : e)
                                                        .toList(),
                                                  ),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  hintText: 'ステータス',
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .background,
                                                  elevation: 4,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0,
                                                  borderRadius: 8,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(16, 4, 8, 4),
                                                  hidesUnderline: true,
                                                  initialOption:
                                                      _form.status.label,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
                                                text: order.note,
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
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 5,
                                            ),
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
                            Expanded(
                              child: Container(
                                child: Text(
                                  alert,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(36, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent('Button_ON_TAP');
                                  final status = _orderStatus();
                                  final numbers =
                                      shippingForms.asMap().entries.map((e) {
                                    indivSwitchValue
                                        ? e.value.trackingIndex = e.key
                                        : e.value.status = status;
                                    return e.value.trackingNumber;
                                  }).toList();
                                  final trackingNumber = numbers.reduce(
                                      (value, element) =>
                                          value + ',' + element);

                                  trackingNumbers = numbers;
                                  final formValidate = _validateForm();
                                  if (!formValidate) return;

                                  logFirebaseEvent('Button_Alert-Dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('注文更新'),
                                                content: Container(
                                                  width: 424,
                                                  child: Text(
                                                      '注文を更新します。「発送済」「到着」を選択した場合、注文者にメールが送信されます。'),
                                                ),
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
                                    final orderUpdateData =
                                        createOrdersRecordData(
                                      indivShipping: indivSwitchValue,
                                      status: status.label,
                                      note: noteController?.text ?? '',
                                      updated: getCurrentTimestamp,
                                    );
                                    await order.reference
                                        .update(orderUpdateData);

                                    final orders = await _setOrders();
                                    final _appCheckToken =
                                        await AppCheckAgent.getToken(context);
                                    await UpdateOrderedPlanCall.call(
                                      shop: shopPath,
                                      uid: currentUserUid,
                                      paymentId: paymentId,
                                      orders: orders,
                                      updated: getCurrentTimestamp.toString(),
                                      accessToken: currentJwtToken,
                                      appCheckToken: _appCheckToken,
                                    );

                                    await UpdateShippingCall.call(
                                      shop: shopPath,
                                      uid: currentUserUid,
                                      paymentId: paymentId,
                                      carrier: carrierValue,
                                      trackingNumber: trackingNumber,
                                      accessToken: currentJwtToken,
                                      appCheckToken: _appCheckToken,
                                    );

                                    logFirebaseEvent('Button_Show-Snack-Bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '注文を更新しました。',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
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
  }
}
