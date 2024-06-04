import '/components/activity_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'activity_model.dart';
export 'activity_model.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  late ActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          title: Text(
            'Activity',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.activityCardModel1,
                    updateCallback: () => setState(() {}),
                    child: const ActivityCardWidget(
                      image:
                          'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/aTovumsNlDjof7YVoU5nW2RHaYn.jpg',
                      title: 'Holloween Ends',
                      subTitle: 'released in 10/14/2022 ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.activityCardModel2,
                    updateCallback: () => setState(() {}),
                    child: const ActivityCardWidget(
                      image:
                          'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg',
                      title: 'Black Adam',
                      subTitle: 'released in 10/21/2022 ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.activityCardModel3,
                    updateCallback: () => setState(() {}),
                    child: const ActivityCardWidget(
                      image:
                          'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/olPXihyFeeNvnaD6IOBltgIV1FU.jpg',
                      title: 'Smile',
                      subTitle: 'released in 09/30/2022 ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: wrapWithModel(
                    model: _model.activityCardModel4,
                    updateCallback: () => setState(() {}),
                    child: const ActivityCardWidget(
                      image:
                          'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/xTsERrOCW15OIYl5aPX7Jbj38wu.jpg',
                      title: 'The Woman King',
                      subTitle: 'released in 09/16/2022',
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
