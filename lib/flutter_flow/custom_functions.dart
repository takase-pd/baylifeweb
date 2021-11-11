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
  else
    return interval;
}

String getUnitCurrency(String currency) {
  if (currency == 'jpy')
    return '円';
  else
    return currency;
}
