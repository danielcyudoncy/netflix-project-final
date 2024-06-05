import '/backend/api_requests/api_calls.dart';
import '/components/big_movie_card_widget.dart';
import '/components/cast_card_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/review_card_widget.dart';
import '/components/section_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_details_model.dart';
export 'movie_details_model.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    super.key,
    this.movieId,
  });

  final int? movieId;

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  late MovieDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MovieDetailsCall.call(
        movieId: widget.movieId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final movieDetailsMovieDetailsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.bigMovieCardModel,
                      updateCallback: () => setState(() {}),
                      child: BigMovieCardWidget(
                        image:
                            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2${getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.backdrop_path''',
                        ).toString()}',
                        title: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.title''',
                        ).toString(),
                        releaseYear: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.release_date''',
                        ).toString(),
                        genres: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.genres[0:2]..name''',
                        ).toString(),
                        duration: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.runtime''',
                        ).toString(),
                        rating: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.vote_average''',
                        ),
                        numberOfVotes: getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.vote_count''',
                        ).toString(),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Overview',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 24.0, 8.0),
                      child: Text(
                        getJsonField(
                          movieDetailsMovieDetailsResponse.jsonBody,
                          r'''$.overview''',
                        ).toString(),
                        maxLines: 5,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                      child: wrapWithModel(
                        model: _model.sectionTitleModel,
                        updateCallback: () => setState(() {}),
                        child: const SectionTitleWidget(
                          title: 'Cast',
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: MovieCastesCall.call(
                          movieId: widget.movieId,
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
                          final castListViewMovieCastesResponse =
                              snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final castes = (MovieCastesCall.castes(
                                        castListViewMovieCastesResponse
                                            .jsonBody,
                                      )?.toList() ??
                                      [])
                                  .take(8)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: castes.length,
                                itemBuilder: (context, castesIndex) {
                                  final castesItem = castes[castesIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: CastCardWidget(
                                      key: Key(
                                          'Keyuu1_${castesIndex}_of_${castes.length}'),
                                      image:
                                          'https://www.themoviedb.org/t/p/w138_and_h175_face${getJsonField(
                                        castesItem,
                                        r'''$.profile_path''',
                                      ).toString()}',
                                      name: getJsonField(
                                        castesItem,
                                        r'''$.original_name''',
                                      ).toString(),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Text(
                          'see all >',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFFE9EEEA),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: const BoxDecoration(),
                      child: FutureBuilder<ApiCallResponse>(
                        future: MovieReviewsCall.call(
                          movieId: widget.movieId,
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
                          final listViewMovieReviewsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final reviews = (MovieReviewsCall.results(
                                        listViewMovieReviewsResponse.jsonBody,
                                      )?.toList() ??
                                      [])
                                  .take(4)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: reviews.length,
                                itemBuilder: (context, reviewsIndex) {
                                  final reviewsItem = reviews[reviewsIndex];
                                  return ReviewCardWidget(
                                    key: Key(
                                        'Keyg76_${reviewsIndex}_of_${reviews.length}'),
                                    image: valueOrDefault<String>(
                                      'https://www.themoviedb.org/t/p/w45_and_h45_face${getJsonField(
                                        reviewsItem,
                                        r'''$.author_details.avatar_path''',
                                      ).toString()}',
                                      'https://www.themoviedb.org/t/p/w45_and_h45_face/utEXl2EDiXBK6f41wCLsvprvMg4.jpg',
                                    ),
                                    name: getJsonField(
                                      reviewsItem,
                                      r'''$.author''',
                                    ).toString(),
                                    review: getJsonField(
                                      reviewsItem,
                                      r'''$.content''',
                                    ).toString(),
                                    rating: 4.5,
                                    duration: '1w ago',
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 16.0),
                      child: Text(
                        'Similar',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Container(
                        width: double.infinity,
                        height: 224.0,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: SimilarMoviesCall.call(
                            movieId: widget.movieId,
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
                            final similarListViewSimilarMoviesResponse =
                                snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final similarMovies =
                                    (SimilarMoviesCall.results(
                                              similarListViewSimilarMoviesResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [])
                                        .take(8)
                                        .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: similarMovies.length,
                                  itemBuilder: (context, similarMoviesIndex) {
                                    final similarMoviesItem =
                                        similarMovies[similarMoviesIndex];
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
                                            'MovieDetails',
                                            queryParameters: {
                                              'movieId': serializeParam(
                                                getJsonField(
                                                  similarMoviesItem,
                                                  r'''$.id''',
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: MovieCardWidget(
                                          key: Key(
                                              'Key7w3_${similarMoviesIndex}_of_${similarMovies.length}'),
                                          image:
                                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${getJsonField(
                                            similarMoviesItem,
                                            r'''$.poster_path''',
                                          ).toString()}',
                                          title: getJsonField(
                                            similarMoviesItem,
                                            r'''$.title''',
                                          ).toString(),
                                          duration: '2h 13min',
                                          rating: getJsonField(
                                            similarMoviesItem,
                                            r'''$.vote_average''',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
