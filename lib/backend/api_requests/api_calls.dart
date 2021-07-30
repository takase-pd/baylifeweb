import 'api_manager.dart';

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
      headers: {},
      params: {
        'name': name,
        'email': email,
        'content': content,
      },
      returnResponse: true,
    );
