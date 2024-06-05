import '/backend/api_requests/api_calls.dart';
import '/components/movie_card_widget.dart';
import '/components/slider_cade_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: PopularMoviesCall.call(),
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
                  final pageViewPopularMoviesResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final popularMovies = (PopularMoviesCall.results(
                                pageViewPopularMoviesResponse.jsonBody,
                              )?.toList() ??
                              [])
                          .take(4)
                          .toList();
                      return SizedBox(
                        width: double.infinity,
                        height: 400.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: max(0,
                                            min(0, popularMovies.length - 1))),
                                scrollDirection: Axis.horizontal,
                                itemCount: popularMovies.length,
                                itemBuilder: (context, popularMoviesIndex) {
                                  final popularMoviesItem =
                                      popularMovies[popularMoviesIndex];
                                  return InkWell(
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
                                              popularMoviesItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: SliderCadeWidget(
                                      key: Key(
                                          'Keyxxr_${popularMoviesIndex}_of_${popularMovies.length}'),
                                      image:
                                          'https://www.themoviedb.org/t/p/w533_and_h300_bestv2${getJsonField(
                                        popularMoviesItem,
                                        r'''$.backdrop_path''',
                                      ).toString()}',
                                      title: getJsonField(
                                        popularMoviesItem,
                                        r'''$.title''',
                                      ).toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 16.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(0,
                                                  popularMovies.length - 1))),
                                  count: popularMovies.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    setState(() {});
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 2.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 24.0,
                                    dotHeight: 6.0,
                                    dotColor: const Color(0x28FFFCFC),
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).primary,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now playing',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'see all >',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: NowPlayingCall.call(),
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
                    final nowPlayingListViewNowPlayingResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final nowPlayingMovies =
                            NowPlayingCall.nowPlayingResults(
                                  nowPlayingListViewNowPlayingResponse.jsonBody,
                                )?.toList() ??
                                [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: nowPlayingMovies.length,
                          itemBuilder: (context, nowPlayingMoviesIndex) {
                            final nowPlayingMoviesItem =
                                nowPlayingMovies[nowPlayingMoviesIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
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
                                          nowPlayingMoviesItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key(
                                      'Keyfuw_${nowPlayingMoviesIndex}_of_${nowPlayingMovies.length}'),
                                  image: valueOrDefault<String>(
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${valueOrDefault<String>(
                                      getJsonField(
                                        nowPlayingMoviesItem,
                                        r'''$.poster_path''',
                                      )?.toString(),
                                      '/e1mjopzAS2KNsvpbpahQ1a6SKSn.jpg',
                                    )}',
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kyeqWdyUXW608qlYkRqosgbbJyK.jpg',
                                  ),
                                  title: getJsonField(
                                    nowPlayingMoviesItem,
                                    r'''$.title''',
                                  ).toString(),
                                  duration: '1h 37min',
                                  rating: getJsonField(
                                    nowPlayingMoviesItem,
                                    r'''$.vote_average ''',
                                  ),
                                  favorite: getJsonField(
                                    nowPlayingMoviesItem,
                                    r'''$.id''',
                                  ).toString(),
                                  unfavorite: getJsonField(
                                    nowPlayingMoviesItem,
                                    r'''$.id''',
                                  ).toString(),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TV Shows',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'see all >',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: PopularTvShowsCall.call(),
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
                    final tVShowsListViewPopularTvShowsResponse =
                        snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final popularShows = PopularTvShowsCall.results(
                              tVShowsListViewPopularTvShowsResponse.jsonBody,
                            )?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: popularShows.length,
                          itemBuilder: (context, popularShowsIndex) {
                            final popularShowsItem =
                                popularShows[popularShowsIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
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
                                          popularShowsItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key(
                                      'Keypnw_${popularShowsIndex}_of_${popularShows.length}'),
                                  image: valueOrDefault<String>(
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${valueOrDefault<String>(
                                      getJsonField(
                                        popularShowsItem,
                                        r'''$.poster_path''',
                                      )?.toString(),
                                      '/e1mjopzAS2KNsvpbpahQ1a6SKSn.jpg',
                                    )}',
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kyeqWdyUXW608qlYkRqosgbbJyK.jpg',
                                  ),
                                  title: getJsonField(
                                    popularShowsItem,
                                    r'''$.name''',
                                  ).toString(),
                                  duration: '1h 37min',
                                  rating: getJsonField(
                                    popularShowsItem,
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
        ),
      ),
    );
  }
}
