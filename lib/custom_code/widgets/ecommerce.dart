import '../../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;

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

class PlanData {
  final String path;
  final int unitAmount;
  final int quantity;
  final String name;
  // final int subtotal;
  final int shippingFeeNormal;
  final bool shippingEachFee;
  final ShippingStatus status;

  PlanData({
    this.path,
    this.unitAmount,
    this.quantity,
    this.name,
    // this.subtotal,
    this.shippingFeeNormal,
    this.shippingEachFee,
    this.status,
  });

  int get subtotal => unitAmount * quantity;
}

enum ShippingStatus {
  contacted,
  shipping,
  shipped,
  confirming,
}

ShippingStatus getShippingStatus(String status) {
  switch (status) {
    case 'contacted':
      return ShippingStatus.contacted;
      break;
    case 'shipping':
      return ShippingStatus.shipping;
      break;
    case 'shipped':
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
