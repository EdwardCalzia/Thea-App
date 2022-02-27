import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCopyWidget extends StatefulWidget {
  const NoteCopyWidget({Key key}) : super(key: key);

  @override
  _NoteCopyWidgetState createState() => _NoteCopyWidgetState();
}

class _NoteCopyWidgetState extends State<NoteCopyWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 410,
      decoration: BoxDecoration(
        color: Color(0xFFEE8B60),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Create Task',
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Fill out the details below to create a new note',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: TextFormField(
              controller: textController1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Task Name',
                hintText: 'Enter your note name here....',
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF606162),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF606162),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Overpass',
                    color: Colors.black,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 6, 16, 0),
            child: TextFormField(
              controller: textController2,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter the description here....',
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF606162),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF606162),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Overpass',
                    color: Colors.black,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 6, 16, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Date and Time Due',
                      hintText: 'Enter the date here....',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF606162),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF606162),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Overpass',
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 26, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'ToDo'),
                      ),
                    );
                  },
                  text: 'Create Task',
                  options: FFButtonOptions(
                    width: 130,
                    height: 50,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.black,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    width: 130,
                    height: 50,
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
