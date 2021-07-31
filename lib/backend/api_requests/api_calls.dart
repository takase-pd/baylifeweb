import 'api_manager.dart';

Future<dynamic> helloWorldCall() => ApiManager.instance.makeApiCall(
      callName: 'helloWorld',
      apiDomain: 'us-central1-baylife-ff782.cloudfunctions.net',
      apiEndpoint: 'helloWorld',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> firestoreCall() => ApiManager.instance.makeApiCall(
      callName: 'Firestore',
      apiDomain: 'us-central1-baylife-ff782.cloudfunctions.net',
      apiEndpoint: 'firstStore',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> registContentCall({
  String name = 'Default Name',
  String email = 'info@particledrawing.com',
  String content = 'Default Content',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Regist Content',
      apiDomain: 'us-central1-baylife-ff782.cloudfunctions.net',
      apiEndpoint: 'sendMail',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'name': name,
        'email': email,
        'content': content,
      },
      returnResponse: true,
    );

Future<dynamic> testCallCall() => ApiManager.instance.makeApiCall(
      callName: 'TestCall',
      apiDomain: 'us-central1-baylife-ff782.cloudfunctions.net',
      apiEndpoint: 'testCall',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnResponse: true,
    );
