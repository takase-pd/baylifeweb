import '../backend/api_requests/api_calls.dart';
import '../components/top_page_footer_widget.dart';
import '../components/top_page_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../service_plan_page/service_plan_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageWidget extends StatefulWidget {
  const TopPageWidget({Key key}) : super(key: key);

  @override
  _TopPageWidgetState createState() => _TopPageWidgetState();
}

class _TopPageWidgetState extends State<TopPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse plans;

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TopPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color(0x00FFFFFF),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 720,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '楽しみ溢れる街',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 64,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '幕張ベイタウン・ベイパーク',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 48,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  'オンラインで住民とつながる仕組み「MAKUHARI Bay Life」',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '楽しみを投稿して住民に知らせよう！',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('Button-ON_TAP');
                              logFirebaseEvent('Button-Backend-Call');
                              plans = await GetPlanCall.call();
                              logFirebaseEvent('Button-Navigate-To');
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServicePlanPageWidget(
                                    plans: (plans?.jsonBody ?? ''),
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            text: 'プラン確認',
                            options: FFButtonOptions(
                              width: 240,
                              height: 60,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color:
                                        FlutterFlowTheme.of(context).textLight,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent('Text-ON_TAP');
                                logFirebaseEvent('Text-Launch-U-R-L');
                                await launchURL(
                                    'https://particledrawing.notion.site/Use-Case-a8f406da8ffc44ab991a371c1596297b');
                              },
                              child: Text(
                                '利用例を見る',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent('Icon-ON_TAP');
                                  logFirebaseEvent('Icon-Launch-U-R-L');
                                  await launchURL(
                                      'https://particledrawing.notion.site/Use-Case-a8f406da8ffc44ab991a371c1596297b');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.externalLinkAlt,
                                  color: FlutterFlowTheme.of(context).textDark,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset(
                            'assets/images/R0002142.JPG',
                            width: double.infinity,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 360,
              constraints: BoxConstraints(
                maxWidth: 1200,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(160, 0, 160, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                      child: Text(
                        'About',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Open Sans',
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Text(
                            'MAKUHARI Bay Life は、幕張ベイタウン・ベイパーク地区に特化した情報＊を発信できる場所です。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Text(
                            'この地域に住む人や事業を営む人たちがつながりやすくなり、それにより楽しみが溢れる街であり続けることに少しでも貢献できればと考えています。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Text(
                            '情報を持つ人が発信しやすい環境を整えること、価値のある情報にアクセスしやすくすることを実現します。',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Text(
                          '＊この地区の住民に役立つ情報であれば、開催場所等は地区外でも投稿いただけます。',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context).pDark,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 640,
              constraints: BoxConstraints(
                maxWidth: 1200,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Text(
                                    'ご利用方法',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '1. ユーザー登録、プラン契約',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '2. 投稿を作成',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Text(
                                    '3. アプリで確認',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    '＊パソコン（デスクトップ、ノートブック）から投稿いただけるサービスです。',
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
                                      0, 0, 0, 8),
                                  child: Text(
                                    '＊投稿は管理者の確認後にアプリに掲載されます。',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .pDark,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/MacBook_Pro.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 720,
              constraints: BoxConstraints(
                maxWidth: 1200,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/images/iPhone_13_-_Midnight.png',
                              width: 250,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Text(
                                  '投稿を見る',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Text(
                                  '住民に投稿を見てもらうアプリ',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    'assets/images/BayLifeIcon_v1.png',
                                    width: 128,
                                    height: 128,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent('Image-ON_TAP');
                                        logFirebaseEvent('Image-Launch-U-R-L');
                                        await launchURL(
                                            'https://apps.apple.com/jp/app/makuhari-baylife/id1582919405');
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/Download_on_the_App_Store_Badge_US-UK_RGB_blk_092917.svg',
                                        width: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent('Image-ON_TAP');
                                        logFirebaseEvent('Image-Launch-U-R-L');
                                        await launchURL(
                                            'https://play.google.com/store/apps/details?id=com.particledrawing.baylife&utm_source=service-web&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1');
                                      },
                                      child: Image.network(
                                        'https://play.google.com/intl/ja/badges/static/images/badges/ja_badge_web_generic.png',
                                        width: 230,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TopPageFooterWidget(),
          ],
        ),
      ),
    );
  }
}
