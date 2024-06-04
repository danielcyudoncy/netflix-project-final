import '/components/big_movie_card_widget.dart';
import '/components/section_title_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movie_details_widget.dart' show MovieDetailsWidget;
import 'package:flutter/material.dart';

class MovieDetailsModel extends FlutterFlowModel<MovieDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BigMovieCard component.
  late BigMovieCardModel bigMovieCardModel;
  // Model for SectionTitle component.
  late SectionTitleModel sectionTitleModel;

  @override
  void initState(BuildContext context) {
    bigMovieCardModel = createModel(context, () => BigMovieCardModel());
    sectionTitleModel = createModel(context, () => SectionTitleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bigMovieCardModel.dispose();
    sectionTitleModel.dispose();
  }
}
