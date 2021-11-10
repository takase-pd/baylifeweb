@JS()
library stripe;

import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/top_page_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:js/js.dart';

const apiKey =
    'pk_test_51ITgUwGe7bJktEzT6F1RcOf7aH2lrjK1jlIne0tpyoWXbdxAa0GpTBjyJp1CIn4EElYQFA7T39wLpRzdBlBCj1zg00TPUJYvsl';

class PlanPageWidget extends StatefulWidget {
  PlanPageWidget({
    Key key,
    this.plans,
  }) : super(key: key);

  final dynamic plans;

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  dynamic subs;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.grayLight,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TopPageHeaderWidget(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Makuhari Bay Life管理画面ご利用プラン',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ボタンをクリックするとアカウント作成画面が開きます。',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Text(
                                'アカウントを作成すると、決済画面が開きます。',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              InkWell(
                                onTap: () async {
                                  await launchURL('https://stripe.com/');
                                },
                                child: Text(
                                  '決済はStripe, Inc.を利用しており、安全にお申し込みいただけます。',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  subs = await subscribeCall(
                                    priceId: getJsonField(widget.plans,
                                            r'''$.result.plans[1].prices[0].priceId''')
                                        .toString(),
                                    url: 'https://localhost:5000/',
                                    uid: currentUserUid,
                                  );
                                  final stripe = Stripe(apiKey);
                                  final sessionId = getJsonField(
                                          subs, r'''$.result.subscribe''')
                                      .toString();
                                  stripe.redirectToCheckout(CheckoutOptions(
                                    sessionId: sessionId,
                                  ));

                                  setState(() {});
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.grayDark,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 500,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 30, 30, 30),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].name''')
                                                .toString(),
                                            style: FlutterFlowTheme.title2,
                                          ),
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].prices[0].unitAmount''')
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].prices[0]. currency''')
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].prices[0]. interval''')
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].prices[0]. intervalCount''')
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            '申し込みを希望の方は、こちらをクリックしてください。',
                                            style: FlutterFlowTheme.bodyText1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

@JS()
class Stripe {
  external Stripe(String key);
  external redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external factory CheckoutOptions({
    String sessionId,
  });
}
