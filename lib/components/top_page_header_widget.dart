import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../top_page/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageHeaderWidget extends StatefulWidget {
  TopPageHeaderWidget({Key key}) : super(key: key);

  @override
  _TopPageHeaderWidgetState createState() => _TopPageHeaderWidgetState();
}

class _TopPageHeaderWidgetState extends State<TopPageHeaderWidget> {
  bool _loadingButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.primaryColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(100, 10, 100, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopPageWidget(),
                  ),
                );
              },
              child: Text(
                'MAKUHARI Bay Life',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.textPrimary,
                  fontSize: 24,
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'ログイン',
              options: FFButtonOptions(
                width: 100,
                height: 50,
                color: FlutterFlowTheme.secondaryDark,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.textSecondary,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton,
            )
          ],
        ),
      ),
    );
  }
}
