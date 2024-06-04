import '/backend/api_requests/api_calls.dart';
import '/components/episode_card_widget.dart';
import '/components/episodes_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/season_card_widget.dart';
import '/components/tv_shows_big_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tv_shows_details_model.dart';
export 'tv_shows_details_model.dart';

class TvShowsDetailsWidget extends StatefulWidget {
  const TvShowsDetailsWidget({
    super.key,
    required this.tvId,
  });

  final int? tvId;

  @override
  State<TvShowsDetailsWidget> createState() => _TvShowsDetailsWidgetState();
}

class _TvShowsDetailsWidgetState extends State<TvShowsDetailsWidget> {
  late TvShowsDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TvShowsDetailsModel());
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<ApiCallResponse>(
            future: TvShowsDetailsCall.call(
              tvId: widget.tvId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnTvShowsDetailsResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.tvShowsBigCardModel,
                      updateCallback: () => setState(() {}),
                      child: TvShowsBigCardWidget(
                        image:
                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.backdrop_path''',
                        ).toString()}',
                        title: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.name''',
                        ).toString(),
                        lastAirEpisode: 'Last Air S${getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.last_episode_to_air.season_number''',
                        ).toString()}E${getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.last_episode_to_air.episode_number''',
                        ).toString()}',
                        genres: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.genres[0:2]..name''',
                        ).toString(),
                        numOfSeasons: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.number_of_seasons''',
                        ),
                        rating: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.vote_average''',
                        ),
                        numOfVotes: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.vote_count''',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Text(
                        'Story',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Text(
                        getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.overview''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 16.0),
                      child: Text(
                        'Last Episode on Air',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: wrapWithModel(
                        model: _model.episodeCardModel,
                        updateCallback: () => setState(() {}),
                        child: EpisodeCardWidget(
                          image:
                              'https://image.tmdb.org/t/p/w1066_and_h600_bestv2/5vUux2vNUTqwCzb7tVcH18XnsF.jpg  ${getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.still_path''',
                          ).toString()}',
                          episode: 'Episode${getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.episode_number''',
                          ).toString()}',
                          name: getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.name''',
                          ).toString(),
                          duration: '60 m',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 16.0),
                      child: Text(
                        'Seasons ',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final seasons = getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.seasons''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: seasons.length,
                          itemBuilder: (context, seasonsIndex) {
                            final seasonsItem = seasons[seasonsIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 0.0, 16.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.85,
                                            child: EpisodesWidget(
                                              tvId: widget.tvId,
                                              seasonNumber: getJsonField(
                                                seasonsItem,
                                                r'''$.season_number ''',
                                              ),
                                              tvShowName: getJsonField(
                                                columnTvShowsDetailsResponse
                                                    .jsonBody,
                                                r'''$.name''',
                                              ).toString(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: SeasonCardWidget(
                                  key: Key(
                                      'Keytxj_${seasonsIndex}_of_${seasons.length}'),
                                  poster:
                                      'https://image.tmdb.org/t/p/w260_and_h390_bestv2${getJsonField(
                                    seasonsItem,
                                    r'''$.poster_path''',
                                  ).toString()}',
                                  season: getJsonField(
                                    seasonsItem,
                                    r'''$.name''',
                                  ).toString(),
                                  numOfEpisodes: getJsonField(
                                    seasonsItem,
                                    r'''$.episode_count''',
                                  ),
                                  airDate: getJsonField(
                                    seasonsItem,
                                    r'''$.air_date''',
                                  ).toString(),
                                  overview: getJsonField(
                                    seasonsItem,
                                    r'''$.overview''',
                                  ).toString(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text(
                      'Similar',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 224.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: SimilarTvShowsCall.call(
                          seriesId: widget.tvId,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewSimilarTvShowsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final similarTvShows = SimilarTvShowsCall.results(
                                    listViewSimilarTvShowsResponse.jsonBody,
                                  )?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: similarTvShows.length,
                                itemBuilder: (context, similarTvShowsIndex) {
                                  final similarTvShowsItem =
                                      similarTvShows[similarTvShowsIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'TvShowsDetails',
                                          queryParameters: {
                                            'tvId': serializeParam(
                                              getJsonField(
                                                similarTvShowsItem,
                                                r'''$.id''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: Key(
                                            'Key4qx_${similarTvShowsIndex}_of_${similarTvShows.length}'),
                                        image: valueOrDefault<String>(
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${valueOrDefault<String>(
                                            getJsonField(
                                              similarTvShowsItem,
                                              r'''$.poster_path''',
                                            )?.toString(),
                                            '/e1mjopzAS2KNsvpbpahQ1a6SKSn.jpg',
                                          )}',
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kyeqWdyUXW608qlYkRqosgbbJyK.jpg',
                                        ),
                                        title: getJsonField(
                                          similarTvShowsItem,
                                          r'''$.name''',
                                        ).toString(),
                                        duration: '1h 37min',
                                        rating: getJsonField(
                                          similarTvShowsItem,
                                          r'''$.vote_average ''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
