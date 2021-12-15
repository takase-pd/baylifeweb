import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/top_page_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../backend/stripe/stripe_checkout.dart';

class CreateAccountPageWidget extends StatefulWidget {
  const CreateAccountPageWidget({
    Key key,
    this.priceId,
  }) : super(key: key);

  final String priceId;

  @override
  _CreateAccountPageWidgetState createState() =>
      _CreateAccountPageWidgetState();
}

class _CreateAccountPageWidgetState extends State<CreateAccountPageWidget> {
  ApiCallResponse subsEmail;
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  ApiCallResponse subsGoogle;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
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
      backgroundColor: FlutterFlowTheme.background,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(300, 50, 300, 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: AutoSizeText(
                          'ユーザー登録後、決済ページが開きます。',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: 360,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.secondaryColor,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: TextFormField(
                                    controller: emailAddressController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      labelStyle: FlutterFlowTheme.bodyText1,
                                      hintText: 'Enter your email...',
                                      hintStyle: FlutterFlowTheme.bodyText1,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          width: 360,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.secondaryColor,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: !passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: FlutterFlowTheme.bodyText1,
                                      hintText: 'Enter your password...',
                                      hintStyle: FlutterFlowTheme.bodyText1,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordVisibility =
                                              !passwordVisibility,
                                        ),
                                        child: Icon(
                                          passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await launchURL(
                                    'https://baylife.particledrawing.com/terms.html');
                              },
                              child: Text(
                                '利用規約',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.pDark,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://baylife.particledrawing.com/terms.html');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.externalLinkAlt,
                                  color: FlutterFlowTheme.pDark,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              '、',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.bodyText1,
                            ),
                            InkWell(
                              onTap: () async {
                                await launchURL(
                                    'https://www.particledrawing.com/privacy');
                              },
                              child: Text(
                                'プライバシーポリシー',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.pDark,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      'https://www.particledrawing.com/privacy');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.externalLinkAlt,
                                  color: FlutterFlowTheme.pDark,
                                  size: 16,
                                ),
                              ),
                            ),
                            Text(
                              'に同意の上、ご登録ください。',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final user = await createAccountWithEmail(
                              context,
                              emailAddressController.text,
                              passwordController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            subsEmail = await subscribeCall(
                              priceId: widget.priceId,
                              url: 'https://baylife.particledrawing.com/',
                              uid: currentUserUid,
                            );
                            final sessionId = getJsonField(subsEmail.jsonBody,
                                    r'''$.result.subscribe''')
                                .toString();
                            redirectToCheckout(sessionId);

                            setState(() {});
                          },
                          text: '上記に同意して登録',
                          options: FFButtonOptions(
                            width: 240,
                            height: 60,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.textLight,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: AutoSizeText(
                          'Or use a social account to create user',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                          child: Container(
                            width: 230,
                            height: 44,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final user =
                                          await signInWithGoogle(context);
                                      if (user == null) {
                                        return;
                                      }
                                      subsGoogle = await subscribeCall(
                                        priceId: widget.priceId,
                                        url:
                                            'https://baylife.particledrawing.com/',
                                        uid: currentUserUid,
                                      );
                                      final sessionId = getJsonField(
                                              subsGoogle.jsonBody,
                                              r'''$.result.subscribe''')
                                          .toString();
                                      redirectToCheckout(sessionId);

                                      setState(() {});
                                    },
                                    text: 'Sign up with Google',
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.transparent,
                                      size: 20,
                                    ),
                                    options: FFButtonOptions(
                                      width: 230,
                                      height: 44,
                                      color: Colors.white,
                                      textStyle: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFF606060),
                                        fontSize: 17,
                                      ),
                                      elevation: 4,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                      borderRadius: 12,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.83, 0),
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await launchURL(
                              'https://baylife.particledrawing.com/terms.html');
                        },
                        child: Text(
                          '利用規約',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://www.particledrawing.com/privacy');
                          },
                          child: Text(
                            'プライバシーポリシー',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
