import '../components/top_page_footer_widget.dart';
import '../components/top_page_header_widget.dart';
import '../create_account_page/create_account_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({
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
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlanPage'});
  }

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
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 640,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Makuhari Bay Life投稿サービスご利用プラン',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Text(
                          '企業、団体の形態ごとに異なるプランをご用意しています。',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          '1. ${getJsonField(
                            widget.plans,
                            r'''$.result.plans[0].name''',
                          ).toString()}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          '2. ${getJsonField(
                            widget.plans,
                            r'''$.result.plans[2].name''',
                          ).toString()}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          '3. ${getJsonField(
                            widget.plans,
                            r'''$.result.plans[1].name''',
                          ).toString()}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          '4. ${getJsonField(
                            widget.plans,
                            r'''$.result.plans[3].name''',
                          ).toString()}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 720,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'ボタンをクリックするとアカウント登録画面が開きます。',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'アカウントを登録すると、決済画面が開きます。',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('Text-ON_TAP');
                                    logFirebaseEvent('Text-Launch-U-R-L');
                                    await launchURL('https://stripe.com/');
                                  },
                                  child: Text(
                                    '決済は',
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('Text-ON_TAP');
                                    logFirebaseEvent('Text-Launch-U-R-L');
                                    await launchURL('https://stripe.com/');
                                  },
                                  child: Text(
                                    'stripe',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .pDark,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 0, 3, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent('Icon-ON_TAP');
                                      logFirebaseEvent('Icon-Launch-U-R-L');
                                      await launchURL('https://stripe.com/');
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.externalLinkAlt,
                                      color: FlutterFlowTheme.of(context).pDark,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  'を利用しており、安全にお申し込みいただけます。',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent('Text-ON_TAP');
                                  logFirebaseEvent('Text-Launch-U-R-L');
                                  await launchURL(
                                      'https://baylife-ff782.web.app/terms.html');
                                },
                                child: Text(
                                  '利用規約',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color:
                                            FlutterFlowTheme.of(context).pDark,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('Icon-ON_TAP');
                                    logFirebaseEvent('Icon-Launch-U-R-L');
                                    await launchURL(
                                        'https://baylife-ff782.web.app/terms.html');
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.externalLinkAlt,
                                    color: FlutterFlowTheme.of(context).pDark,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(
                                '、',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent('Text-ON_TAP');
                                  logFirebaseEvent('Text-Launch-U-R-L');
                                  await launchURL(
                                      'https://www.particledrawing.com/privacy');
                                },
                                child: Text(
                                  'プライバシーポリシー',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color:
                                            FlutterFlowTheme.of(context).pDark,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent('Icon-ON_TAP');
                                    logFirebaseEvent('Icon-Launch-U-R-L');
                                    await launchURL(
                                        'https://www.particledrawing.com/privacy');
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.externalLinkAlt,
                                    color: FlutterFlowTheme.of(context).pDark,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(
                                'に同意の上、下記のプランをお申し込みください。',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      getJsonField(
                        widget.plans,
                        r'''$.result.plans[0].name''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).pDark,
                            fontSize: 40,
                          ),
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
                            '自社の情報を投稿できる仕組みをご利用いただけます。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '企業規模が大きい場合、複数お申し込みをお願いする可能性があります。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Card-ON_TAP');
                          logFirebaseEvent('Card-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccountPageWidget(
                                priceId: getJsonField(
                                  widget.plans,
                                  r'''$.result.plans[0].prices[0].priceId''',
                                ).toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).tDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 400,
                            height: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40, 30, 40, 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getJsonField(
                                      widget.plans,
                                      r'''$.result.plans[0].prices[0].description''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '利用期間',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            getJsonField(
                                              widget.plans,
                                              r'''$.result.plans[0].prices[0].intervalCount''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[0].prices[0].interval''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '月額',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getJsonField(
                                              widget.plans,
                                              r'''$.result.plans[0].prices[0].unitAmount''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[0].prices[0].currency''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                            logFirebaseEvent('Card-ON_TAP');
                            logFirebaseEvent('Card-Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateAccountPageWidget(
                                  priceId: getJsonField(
                                    widget.plans,
                                    r'''$.result.plans[0].prices[1].priceId''',
                                  ).toString(),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).tDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 400,
                              height: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 30, 40, 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(
                                        widget.plans,
                                        r'''$.result.plans[0].prices[1].description''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '利用期間',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[0].prices[1].intervalCount''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                getJsonField(
                                                  widget.plans,
                                                  r'''$.result.plans[0].prices[1].interval''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '月額',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[0].prices[1].unitAmount''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                getJsonField(
                                                  widget.plans,
                                                  r'''$.result.plans[0].prices[1].currency''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      getJsonField(
                        widget.plans,
                        r'''$.result.plans[2].name''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).pDark,
                            fontSize: 40,
                          ),
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
                            '自機関の情報を投稿できる仕組みをご利用いただけます。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '当プランは無償でご利用いただけます。',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '団体規模が大きい場合、複数お申し込みをお願いする可能性があります。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('Button-ON_TAP');
                          logFirebaseEvent('Button-Alert-Dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('問い合わせページに遷移'),
                                    content: Text('問い合わせページからご連絡ください。'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Button-Launch-U-R-L');
                            await launchURL(
                                'https://www.particledrawing.com/contact');
                          }
                        },
                        text: '問い合わせ',
                        options: FFButtonOptions(
                          width: 240,
                          height: 60,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).textLight,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      getJsonField(
                        widget.plans,
                        r'''$.result.plans[1].name''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).pDark,
                            fontSize: 40,
                          ),
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
                            '自事業の情報を投稿できる仕組みをご利用いただけます。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '事業規模が大きい場合、複数お申し込みをお願いする可能性があります。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent('Card-ON_TAP');
                          logFirebaseEvent('Card-Navigate-To');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccountPageWidget(
                                priceId: getJsonField(
                                  widget.plans,
                                  r'''$.result.plans[1].prices[0].priceId''',
                                ).toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).tDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 400,
                            height: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40, 30, 40, 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getJsonField(
                                      widget.plans,
                                      r'''$.result.plans[1].prices[0].description''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '利用期間',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            getJsonField(
                                              widget.plans,
                                              r'''$.result.plans[1].prices[0].intervalCount''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[1].prices[0].interval''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '月額',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getJsonField(
                                              widget.plans,
                                              r'''$.result.plans[1].prices[0].unitAmount''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                widget.plans,
                                                r'''$.result.plans[1].prices[0].currency''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 480,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      getJsonField(
                        widget.plans,
                        r'''$.result.plans[3].name''',
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).pDark,
                            fontSize: 40,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      '（限定5社）',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).pDark,
                          ),
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
                            '自社または顧客の情報を投稿できる仕組みをご利用いただけます。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            '企業規模が大きい場合、複数お申し込みをお願いする可能性があります。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('Button-ON_TAP');
                          logFirebaseEvent('Button-Alert-Dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('問い合わせページに遷移'),
                                    content: Text('問い合わせページからご連絡ください。'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Button-Launch-U-R-L');
                            await launchURL(
                                'https://www.particledrawing.com/contact');
                          }
                        },
                        text: '問い合わせ',
                        options: FFButtonOptions(
                          width: 240,
                          height: 60,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).textLight,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TopPageFooterWidget(),
          ],
        ),
      ),
    );
  }
}
