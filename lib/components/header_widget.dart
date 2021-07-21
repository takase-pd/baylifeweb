import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
        border: Border.all(
          width: 0.05,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MAKUHARI Bay Life',
              style: FlutterFlowTheme.title3.override(
                fontFamily: 'Poppins',
              ),
            ),
            InkWell(
              onTap: () async {
                Scaffold.of(context).openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}