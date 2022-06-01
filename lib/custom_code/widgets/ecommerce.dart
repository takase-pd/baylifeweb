import '../../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'dart:math';

class OrderDetails {
  final String paymentId;
  final stripe.ShippingDetails shipping;
  final stripe.BillingDetails billing;

  OrderDetails({
    this.paymentId,
    this.shipping,
    this.billing,
  });
}

class OrderedPlan {
  final String path;
  final int unitAmount;
  final int quantity;
  final String name;
  final ShippingStatus status;
  final int trackingIndex;
  final DateTime updated;

  OrderedPlan({
    this.path,
    this.unitAmount,
    this.quantity,
    this.name,
    this.status,
    this.trackingIndex,
    this.updated,
  });

  int get subtotal => unitAmount * quantity;
  String get id => path.split('/').last;
}

class ShippinStatusForm {
  final String id;
  final String planName;
  TextEditingController controller;
  String trackingNumber;
  ShippingStatus status;

  ShippinStatusForm({
    @required this.id,
    @required this.planName,
    @required this.trackingNumber,
    @required this.status,
    @required this.controller,
  });

  factory ShippinStatusForm.create(
    final String id,
    final String planName,
    final String trackingNumber,
    final ShippingStatus status,
  ) {
    return ShippinStatusForm(
      id: id != '' ? id : Random().nextInt(99999).toString(),
      planName: planName,
      trackingNumber: trackingNumber,
      status: status,
      controller: TextEditingController(text: trackingNumber),
    );
  }

  ShippinStatusForm changeTrackingNumber(
    final String trackingNumber,
  ) {
    return ShippinStatusForm(
      id: this.id,
      planName: this.planName,
      trackingNumber: trackingNumber,
      status: this.status,
      controller: this.controller,
    );
  }

  ShippinStatusForm changeStatus(
    final ShippingStatus status,
  ) {
    return ShippinStatusForm(
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

  // @override
  // String toString() {
  //   return trackingNumber;
  // }
}

enum ShippingStatus {
  contacted,
  confirming,
  shipping,
  shipped,
}

extension ShippingStatusExt on ShippingStatus {
  static final labels = {
    ShippingStatus.contacted: '注文',
    ShippingStatus.confirming: '確認中',
    ShippingStatus.shipping: '発送済',
    ShippingStatus.shipped: '到着',
  };

  String get label => labels[this];

  static List<String> get labelList =>
      labels.entries.map((e) => labels[e.key]).toList();
}

ShippingStatus getShippingStatus(String status) {
  switch (status) {
    case 'contacted':
      return ShippingStatus.contacted;
      break;
    case '注文':
      return ShippingStatus.contacted;
      break;
    case 'shipping':
      return ShippingStatus.shipping;
      break;
    case '発送済':
      return ShippingStatus.shipping;
      break;
    case 'shipped':
      return ShippingStatus.shipped;
      break;
    case '到着':
      return ShippingStatus.shipped;
      break;
    default:
      return ShippingStatus.confirming;
      break;
  }
}

FaIcon shippingStatusIcon(BuildContext context, ShippingStatus _status) {
  IconData _icon;
  double _size;
  switch (_status) {
    case ShippingStatus.contacted:
      _icon = Icons.send_rounded;
      _size = 32;
      break;
    case ShippingStatus.shipping:
      _icon = FontAwesomeIcons.shippingFast;
      _size = 24;
      break;
    case ShippingStatus.shipped:
      _icon = FontAwesomeIcons.box;
      _size = 24;
      break;
    default:
      _icon = Icons.search_rounded;
      _size = 32;
      break;
  }
  return FaIcon(
    _icon,
    color: FlutterFlowTheme.of(context).secondaryColor,
    size: _size,
  );
}
