import '/components/episode_card_widget.dart';
import '/components/tv_shows_big_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tv_shows_details_widget.dart' show TvShowsDetailsWidget;
import 'package:flutter/material.dart';

class TvShowsDetailsModel extends FlutterFlowModel<TvShowsDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TvShowsBigCard component.
  late TvShowsBigCardModel tvShowsBigCardModel;
  // Model for EpisodeCard component.
  late EpisodeCardModel episodeCardModel;

  @override
  void initState(BuildContext context) {
    tvShowsBigCardModel = createModel(context, () => TvShowsBigCardModel());
    episodeCardModel = createModel(context, () => EpisodeCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tvShowsBigCardModel.dispose();
    episodeCardModel.dispose();
  }
}
