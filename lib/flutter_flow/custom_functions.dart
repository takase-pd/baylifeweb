import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import '../../auth/auth_util.dart';

String getMultilineText(String multilineText) {
  return multilineText.replaceAll(RegExp(r'\n'), r'\n');
}

String getInterval(String interval) {
  if (interval == 'month')
    return 'ヶ月';
  else if (interval == 'year')
    return '年';
  else
    return interval;
}

String getUnitCurrency(String currency) {
  if (currency == 'jpy')
    return '円';
  else
    return currency;
}

String getUnitAmount(String unitAmount, String interval) {
  String ua = unitAmount;
  if (interval == 'year') ua = (int.parse(unitAmount) / 12).toString();

  Function mathFunc = (Match match) => '${match[1]},';
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String result = ua.replaceAllMapped(reg, mathFunc);
  return '$result';
}
