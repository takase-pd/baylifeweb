import '../../auth/auth_util.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../custom_code/widgets/index.dart';
import '../../auth/firebase_user_provider.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:bay_life_web/backend/backend.dart';
import 'dart:math';

class OrderDetails {
  final String paymentId;
  final stripe.ShippingDetails shipping;
  final stripe.BillingDetails billing;

  OrderDetails._create({
    this.paymentId,
    this.shipping,
    this.billing,
  });

  static Future<OrderDetails> create(
    String shopPath,
    String paymentId,
    BuildContext context,
  ) async {
    OrderDetails _details;

    if (!currentUser.loggedIn) return _details;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return _details;

    final apiCallOutput = await GetOrderDetailsCall.call(
      shop: shopPath,
      uid: currentUserUid,
      paymentId: paymentId,
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
    _details = OrderDetails._create(
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
        carrier: _apiJson['details']['shipping']['carrier'],
        trackingNumber: _apiJson['details']['shipping']['tracking_number'],
      ),
    );

    return _details;
  }

  String get carrier => shipping.carrier ?? '';
  List<String> get trackingNumbers => shipping.trackingNumber?.split(',') ?? [];
}

class OrderedPlan {
  final String path;
  final int unitAmount;
  final int quantity;
  final String name;
  final ShippingStatus status;
  final int trackingIndex;
  final DateTime updated;

  OrderedPlan._create({
    this.path,
    this.unitAmount,
    this.quantity,
    this.name,
    this.status,
    this.trackingIndex,
    this.updated,
  });

  static Future<List<OrderedPlan>> create(
    String shopPath,
    String paymentId,
    BuildContext context,
  ) async {
    List<OrderedPlan> _plans = [];

    if (!currentUser.loggedIn) return _plans;

    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return _plans;

    final apiCallOutput = await GetOrderedPlansCall.call(
      shop: shopPath,
      uid: currentUserUid,
      paymentId: paymentId,
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
      _plans.add(OrderedPlan._create(
        path: plan['path'],
        unitAmount: plan['unit_amount'],
        quantity: plan['quantity'],
        name: plan['name'],
        status: ShippingStatusExt.create(plan['status']),
        trackingIndex: plan['tracking_index'],
        updated: Timestamp(
          plan['updated']['_seconds'],
          plan['updated']['_nanoseconds'],
        ).toDate(),
      ));
    });

    return _plans;
  }

  int get subtotal => unitAmount * quantity;
  String get id => path.split('/').last;
}

class TransactionsLaw {
  final String path;
  final String address;
  final String company;
  final String delvTime;
  final String director;
  final String email;
  final String otherFees;
  final String paymentMethod;
  final String phone;
  final String postalCode;
  final String rec; // return, exchange, cancellation
  final String returnCharge;
  final String returnPeriod;
  final String unitAmount;
  final String web;

  TransactionsLaw({
    this.path,
    this.address,
    this.company,
    this.delvTime,
    this.director,
    this.email,
    this.otherFees,
    this.paymentMethod,
    this.phone,
    this.postalCode,
    this.rec,
    this.returnCharge,
    this.returnPeriod,
    this.unitAmount,
    this.web,
  });

  static Future<TransactionsLaw> create(
    String path,
    BuildContext context,
  ) async {
    final _appCheckToken = await AppCheckAgent.getToken(context);
    if (_appCheckToken == null) return TransactionsLaw();

    final apiCallOutput = await TransactionsLawCall.call(
      path: path,
      appCheckToken: _appCheckToken,
    );
    final _apiJson = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
    if (!_apiJson['success']) return TransactionsLaw(path: path);

    return TransactionsLaw(
      path: path,
      address: _apiJson['law']['address'],
      company: _apiJson['law']['company'],
      delvTime: _apiJson['law']['delvTime'],
      director: _apiJson['law']['director'],
      email: _apiJson['law']['email'],
      otherFees: _apiJson['law']['otherFees'],
      paymentMethod: _apiJson['law']['paymentMethod'],
      phone: _apiJson['law']['phone'],
      postalCode: _apiJson['law']['postalCode'],
      rec: _apiJson['law']['rec'],
      returnCharge: _apiJson['law']['returnCharge'],
      returnPeriod: _apiJson['law']['returnPeriod'],
      unitAmount: _apiJson['law']['unitAmount'],
      web: _apiJson['law']['web'],
    );
  }
}

class ShippingForm {
  final String id;
  final String planName;
  TextEditingController controller;
  String trackingNumber;
  int trackingIndex = 0;
  ShippingStatus status;

  ShippingForm._create({
    this.id,
    this.planName,
    this.trackingNumber,
    this.status,
    this.controller,
  });

  factory ShippingForm.create(
    final String id,
    final String planName,
    final String trackingNumber,
    final ShippingStatus status,
  ) {
    return ShippingForm._create(
      id: id != '' ? id : Random().nextInt(99999).toString(),
      planName: planName,
      trackingNumber: trackingNumber,
      status: status,
      controller: TextEditingController(text: trackingNumber),
    );
  }

  static List<ShippingForm> createForm(
    OrdersRecord order,
    List<OrderedPlan> plans,
    OrderDetails details,
    bool switchListTileValue,
    String paymentId,
  ) {
    List<ShippingForm> statusForms = [];
    final trackingNumbers = details.trackingNumbers;
    switchListTileValue
        ? plans.forEach(
            (plan) async => statusForms.add(
              ShippingForm.create(
                plan.id,
                plan.name,
                trackingNumbers.length == 0
                    ? ''
                    : trackingNumbers[plan.trackingIndex],
                plan.status,
              ),
            ),
          )
        : statusForms.add(
            ShippingForm.create(
              paymentId.substring(3),
              '',
              trackingNumbers.length == 0 ? '' : trackingNumbers[0],
              ShippingStatusExt.create(order.status),
            ),
          );

    return statusForms;
  }

  ShippingForm changeTrackingNumber(
    final String trackingNumber,
  ) {
    return ShippingForm._create(
      id: this.id,
      planName: this.planName,
      trackingNumber: trackingNumber,
      status: this.status,
      controller: this.controller,
    );
  }

  ShippingForm changeStatus(
    final ShippingStatus status,
  ) {
    return ShippingForm._create(
      id: this.id,
      planName: this.planName,
      trackingNumber: this.trackingNumber,
      status: status,
      controller: this.controller,
    );
  }

  void dispose() {
    controller.dispose();
  }
}

class CurrencyChecker {
  final bool success;
  final TextEditingController controller;
  final int currency;

  CurrencyChecker._create({
    this.success,
    this.controller,
    this.currency,
  });

  factory CurrencyChecker.create(String text) {
    final matches = RegExp(r'[0-9]').allMatches(text);
    final success = matches != null && matches.length != 0 ? true : false;
    final currency = success
        ? int.parse(matches.map((match) => match.group(0)).toList().join())
        : 0;
    final controller = TextEditingController(
        text: formatNumber(
      currency,
      formatType: FormatType.custom,
      currency: '￥',
      format: '#,##0',
      locale: 'ja_JP',
    ));
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
    return CurrencyChecker._create(
      success: success,
      controller: controller,
      currency: currency,
    );
  }
}

enum ShippingStatus {
  ordered,
  confirming,
  shipping,
  shipped,
}

extension ShippingStatusExt on ShippingStatus {
  static final _label = {
    ShippingStatus.ordered: '注文',
    ShippingStatus.confirming: '確認中',
    ShippingStatus.shipping: '発送済',
    ShippingStatus.shipped: '到着',
  };

  static final _icon = {
    ShippingStatus.ordered: Icons.send_rounded,
    ShippingStatus.confirming: Icons.search_rounded,
    ShippingStatus.shipping: FontAwesomeIcons.truckFast,
    ShippingStatus.shipped: FontAwesomeIcons.box,
  };

  static final _size = {
    ShippingStatus.ordered: 32.0,
    ShippingStatus.confirming: 32.0,
    ShippingStatus.shipping: 24.0,
    ShippingStatus.shipped: 24.0,
  };

  static List<String> get labelList =>
      _label.entries.map((e) => _label[e.key]).toList();

  static ShippingStatus create(String status) {
    switch (status) {
      case '確認中':
        return ShippingStatus.confirming;
        break;
      case '発送済':
        return ShippingStatus.shipping;
        break;
      case '到着':
        return ShippingStatus.shipped;
        break;
      default:
        return ShippingStatus.ordered;
        break;
    }
  }

  String get label => _label[this];

  IconData get icon => _icon[this];

  double get size => _size[this];
}

enum ShippingCarrier {
  yamato,
  sagawa,
  japanpost,
  inhouse,
  other,
}

extension ShippingCarrierExt on ShippingCarrier {
  static final _label = {
    ShippingCarrier.yamato: 'クロネコヤマト',
    ShippingCarrier.sagawa: '佐川急便',
    ShippingCarrier.japanpost: '日本郵便',
    ShippingCarrier.inhouse: '自社配送',
    ShippingCarrier.other: 'その他',
  };

  static List<String> get labelList =>
      _label.entries.map((e) => _label[e.key]).toList();
}

extension PlansRecordExt on PlansRecord {
  Future<String> getShopName() async {
    final shop = await ShopsRecord.getDocumentOnce(this.shop);
    return shop.shopName;
  }
}
