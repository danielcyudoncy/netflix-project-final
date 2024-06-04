import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoviesRecord extends FirestoreRecord {
  MoviesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "movie_id" field.
  int? _movieId;
  int get movieId => _movieId ?? 0;
  bool hasMovieId() => _movieId != null;

  // "movie_image" field.
  String? _movieImage;
  String get movieImage => _movieImage ?? '';
  bool hasMovieImage() => _movieImage != null;

  // "movie_details" field.
  String? _movieDetails;
  String get movieDetails => _movieDetails ?? '';
  bool hasMovieDetails() => _movieDetails != null;

  // "movie_title" field.
  String? _movieTitle;
  String get movieTitle => _movieTitle ?? '';
  bool hasMovieTitle() => _movieTitle != null;

  // "release_date" field.
  double? _releaseDate;
  double get releaseDate => _releaseDate ?? 0.0;
  bool hasReleaseDate() => _releaseDate != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "movie_language" field.
  String? _movieLanguage;
  String get movieLanguage => _movieLanguage ?? '';
  bool hasMovieLanguage() => _movieLanguage != null;

  // "movie_genre" field.
  String? _movieGenre;
  String get movieGenre => _movieGenre ?? '';
  bool hasMovieGenre() => _movieGenre != null;

  void _initializeFields() {
    _movieId = castToType<int>(snapshotData['movie_id']);
    _movieImage = snapshotData['movie_image'] as String?;
    _movieDetails = snapshotData['movie_details'] as String?;
    _movieTitle = snapshotData['movie_title'] as String?;
    _releaseDate = castToType<double>(snapshotData['release_date']);
    _duration = castToType<double>(snapshotData['duration']);
    _rating = castToType<double>(snapshotData['rating']);
    _movieLanguage = snapshotData['movie_language'] as String?;
    _movieGenre = snapshotData['movie_genre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movies');

  static Stream<MoviesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoviesRecord.fromSnapshot(s));

  static Future<MoviesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoviesRecord.fromSnapshot(s));

  static MoviesRecord fromSnapshot(DocumentSnapshot snapshot) => MoviesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoviesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoviesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoviesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoviesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoviesRecordData({
  int? movieId,
  String? movieImage,
  String? movieDetails,
  String? movieTitle,
  double? releaseDate,
  double? duration,
  double? rating,
  String? movieLanguage,
  String? movieGenre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'movie_id': movieId,
      'movie_image': movieImage,
      'movie_details': movieDetails,
      'movie_title': movieTitle,
      'release_date': releaseDate,
      'duration': duration,
      'rating': rating,
      'movie_language': movieLanguage,
      'movie_genre': movieGenre,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoviesRecordDocumentEquality implements Equality<MoviesRecord> {
  const MoviesRecordDocumentEquality();

  @override
  bool equals(MoviesRecord? e1, MoviesRecord? e2) {
    return e1?.movieId == e2?.movieId &&
        e1?.movieImage == e2?.movieImage &&
        e1?.movieDetails == e2?.movieDetails &&
        e1?.movieTitle == e2?.movieTitle &&
        e1?.releaseDate == e2?.releaseDate &&
        e1?.duration == e2?.duration &&
        e1?.rating == e2?.rating &&
        e1?.movieLanguage == e2?.movieLanguage &&
        e1?.movieGenre == e2?.movieGenre;
  }

  @override
  int hash(MoviesRecord? e) => const ListEquality().hash([
        e?.movieId,
        e?.movieImage,
        e?.movieDetails,
        e?.movieTitle,
        e?.releaseDate,
        e?.duration,
        e?.rating,
        e?.movieLanguage,
        e?.movieGenre
      ]);

  @override
  bool isValidKey(Object? o) => o is MoviesRecord;
}
