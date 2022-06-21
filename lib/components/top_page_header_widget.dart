import '../components/top_header_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../top_page/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageHeaderWidget extends StatefulWidget {
  const TopPageHeaderWidget({Key key}) : super(key: key);

  @override
  _TopPageHeaderWidgetState createState() => _TopPageHeaderWidgetState();
}

class _TopPageHeaderWidgetState extends State<TopPageHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TopHeaderWidget(),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('TOP_HEADER_Text_nfi6ruex_ON_TAP');
                    logFirebaseEvent('Text_Navigate-To');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopPageWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'MAKUHARI Bay Life',
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('TOP_PAGE_HEADER_COMP_ログイン_BTN_ON_TAP');
                    logFirebaseEvent('Button_Navigate-To');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageWidget(),
                      ),
                    );
                  },
                  text: 'ログイン',
                  options: FFButtonOptions(
                    width: 100,
                    height: 36,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).textLight,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
