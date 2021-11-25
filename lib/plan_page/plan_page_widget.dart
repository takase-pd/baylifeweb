import '../components/top_page_footer_widget.dart';
import '../components/top_page_header_widget.dart';
import '../create_account_page/create_account_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: TopPageHeaderWidget(),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Text(
                      'Makuhari Bay Life管理画面ご利用プラン',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title1,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'ボタンをクリックするとアカウント作成画面が開きます。',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'アカウントを作成すると、決済画面が開きます。',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: InkWell(
                          onTap: () async {
                            await launchURL('https://stripe.com/');
                          },
                          child: Text(
                            '決済はStripe, Inc.を利用しており、安全にお申し込みいただけます。',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 560,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      '企業様用プラン',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.title2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '企業が投稿できる仕組みをご利用いただけます。',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '企業規模が大きい場合、複数お申し込みをお願いする可能性があります。',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccountPageWidget(
                                priceId: getJsonField(widget.plans,
                                        r'''$.result.plans[1].prices[0].priceId''')
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.tDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 420,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getJsonField(widget.plans,
                                            r'''$.result.plans[1].name''')
                                        .toString(),
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    getJsonField(widget.plans,
                                            r'''$.result.plans[1].prices[0].description''')
                                        .toString(),
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '利用期間',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            getJsonField(widget.plans,
                                                    r'''$.result.plans[1].prices[0].intervalCount''')
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              functions.getInterval(getJsonField(
                                                      widget.plans,
                                                      r'''$.result.plans[1].prices[0].interval''')
                                                  .toString()),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '月額',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            functions.getUnitAmount(getJsonField(
                                                    widget.plans,
                                                    r'''$.result.plans[1].prices[0].unitAmount''')
                                                .toString()),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              functions.getUnitCurrency(
                                                  getJsonField(widget.plans,
                                                          r'''$.result.plans[1].prices[0].currency''')
                                                      .toString()),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccountPageWidget(
                                  priceId: getJsonField(widget.plans,
                                          r'''$.result.plans[1].prices[1].priceId''')
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.tDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 420,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(widget.plans,
                                              r'''$.result.plans[1].name''')
                                          .toString(),
                                      style: FlutterFlowTheme.title3,
                                    ),
                                    Text(
                                      getJsonField(widget.plans,
                                              r'''$.result.plans[1].prices[1].description''')
                                          .toString(),
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '利用期間',
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              getJsonField(widget.plans,
                                                      r'''$.result.plans[1].prices[1].intervalCount''')
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                functions.getInterval(getJsonField(
                                                        widget.plans,
                                                        r'''$.result.plans[1].prices[1].interval''')
                                                    .toString()),
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '月額',
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              functions.getUnitAmount(getJsonField(
                                                      widget.plans,
                                                      r'''$.result.plans[1].prices[1].unitAmount''')
                                                  .toString()),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                functions.getUnitCurrency(
                                                    getJsonField(widget.plans,
                                                            r'''$.result.plans[1].prices[1].currency''')
                                                        .toString()),
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
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
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            TopPageFooterWidget()
          ],
        ),
      ),
    );
  }
}
