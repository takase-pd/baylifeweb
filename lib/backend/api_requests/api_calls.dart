import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RegistContentsCall {
  static Future<ApiCallResponse> call({
    String catName = 'デフォルト',
    String catNameAdd = '',
    String title = 'デフォルト',
    String overview = 'デフォルト',
    String detail = 'デフォルト',
    String organizer = 'デフォルト',
    String contact = 'デフォルト',
    String homepage = '',
    String postName = 'デフォルト',
    String postEmail = '',
    String postPhone = '',
    String postOccupation = 'デフォルト',
    bool permission = false,
    String address = 'デフォルト',
    String startDay = '',
    String finalDay = '',
    String postRemarks = '',
    String uid = '',
    String filePath = '',
  }) {
    final body = '''
{
  "data": {
    "catName": "${catName}",
    "catNameAdd": "${catNameAdd}",
    "title": "${title}",
    "overview": "${overview}",
    "detail": "${detail}",
    "organizer": "${organizer}",
    "contact": "${contact}",
    "homepage": "${homepage}",
    "postName": "${postName}",
    "postEmail": "${postEmail}",
    "postPhone": "${postPhone}",
    "postOccupation": "${postOccupation}",
    "permission": ${permission},
    "address": "${address}",
    "startDay": "${startDay}",
    "finalDay": "${finalDay}",
    "filePath": "${filePath}",
    "postRemarks": "${postRemarks}",
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Regist Contents',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/sendMailV1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'catName': catName,
        'catNameAdd': catNameAdd,
        'title': title,
        'overview': overview,
        'detail': detail,
        'organizer': organizer,
        'contact': contact,
        'homepage': homepage,
        'postName': postName,
        'postEmail': postEmail,
        'postPhone': postPhone,
        'postOccupation': postOccupation,
        'permission': permission,
        'address': address,
        'startDay': startDay,
        'finalDay': finalDay,
        'postRemarks': postRemarks,
        'uid': uid,
        'filePath': filePath,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetPlanCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "data": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPlan',
      apiUrl: 'https://asia-northeast1-baylifedev.cloudfunctions.net/getPlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SubscribeCall {
  static Future<ApiCallResponse> call({
    String priceId = '',
    String url = 'https://baylifedev.web.app/',
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "priceId": "${priceId}",
    "url": "${url}",
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Subscribe',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/subscribeV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'priceId': priceId,
        'url': url,
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetSubscriptionCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Subscription',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/getSubscriptionsV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetOrderDetailsCall {
  static Future<ApiCallResponse> call({
    String shop = '',
    String uid = '',
    String paymentId = '',
  }) {
    final body = '''
{
  "data": {
    "shop": "${shop}",
    "uid": "${uid}",
    "paymentId": "${paymentId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Order Details',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-getOrderDetailsV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'shop': shop,
        'uid': uid,
        'paymentId': paymentId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetOrderedPlansCall {
  static Future<ApiCallResponse> call({
    String shop = '',
    String uid = '',
    String paymentId = '',
  }) {
    final body = '''
{
  "data": {
    "shop": "${shop}",
    "uid": "${uid}",
    "paymentId": "${paymentId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Ordered Plans',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-getOrderedPlansV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'shop': shop,
        'uid': uid,
        'paymentId': paymentId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateOrderedPlanCall {
  static Future<ApiCallResponse> call({
    String shop = '',
    String uid = '',
    String paymentId = '',
    String orders = '',
    String updated = '',
  }) {
    final body = '''
{
  "data": {
    "shop": "${shop}",
    "uid": "${uid}",
    "paymentId": "${paymentId}",
    "orders": "${orders}",
    "updated": "${updated}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Ordered Plan',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-updateOrderedPlansV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'shop': shop,
        'uid': uid,
        'paymentId': paymentId,
        'orders': orders,
        'updated': updated,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateShippingCall {
  static Future<ApiCallResponse> call({
    String shop = '',
    String uid = '',
    String paymentId = '',
    String carrier = '',
    String trackingNumber = '',
  }) {
    final body = '''
{
  "data": {
    "shop": "${shop}",
    "uid": "${uid}",
    "paymentId": "${paymentId}",
    "carrier": "${carrier}",
    "tracking_number": "${trackingNumber}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Shipping',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-updateShippingV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'shop': shop,
        'uid': uid,
        'paymentId': paymentId,
        'carrier': carrier,
        'tracking_number': trackingNumber,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
