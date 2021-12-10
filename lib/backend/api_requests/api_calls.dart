import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

Future<ApiCallResponse> registContentsCall({
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
        'https://asia-northeast1-baylife-ff782.cloudfunctions.net/sendMailV1',
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

Future<ApiCallResponse> getPlanCall() {
  final body = '''
{
  "data": {}
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'GetPlan',
    apiUrl:
        'https://asia-northeast1-baylife-ff782.cloudfunctions.net/getPlanV0',
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

Future<ApiCallResponse> subscribeCall({
  String priceId = '',
  String url = 'https://baylife.particledrawing.com/',
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
        'https://asia-northeast1-baylife-ff782.cloudfunctions.net/subscribeV0',
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

Future<ApiCallResponse> getSubscriptionCall({
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
        'https://asia-northeast1-baylife-ff782.cloudfunctions.net/getSubscriptionsV0',
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
