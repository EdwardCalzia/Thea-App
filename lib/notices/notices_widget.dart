import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticesWidget extends StatefulWidget {
  const NoticesWidget({Key key}) : super(key: key);

  @override
  _NoticesWidgetState createState() => _NoticesWidgetState();
}

class _NoticesWidgetState extends State<NoticesWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'stackOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(70, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.9, 0.34),
                            child: Text(
                              'Text',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.9, -0.73),
                            child: Text(
                              'Title',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.89, 0.03),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).darkBG,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor: FlutterFlowTheme.of(context).white,
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'This Notice has been added to your timetable',
                                      style: TextStyle(),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              },
                            ).animated([
                              animationsMap[
                                  'iconButtonOnActionTriggerAnimation']
                            ]),
                          ),
                        ],
                      ).animated(
                          [animationsMap['stackOnActionTriggerAnimation']]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
