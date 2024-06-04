import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MyListRecord extends FirestoreRecord {
  MyListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "favouriteMovies" field.
  List<String>? _favouriteMovies;
  List<String> get favouriteMovies => _favouriteMovies ?? const [];
  bool hasFavouriteMovies() => _favouriteMovies != null;

  // "favouritePictures" field.
  List<String>? _favouritePictures;
  List<String> get favouritePictures => _favouritePictures ?? const [];
  bool hasFavouritePictures() => _favouritePictures != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _favouriteMovies = getDataList(snapshotData['favouriteMovies']);
    _favouritePictures = getDataList(snapshotData['favouritePictures']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myList')
          : FirebaseFirestore.instance.collectionGroup('myList');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('myList').doc(id);

  static Stream<MyListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyListRecord.fromSnapshot(s));

  static Future<MyListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyListRecord.fromSnapshot(s));

  static MyListRecord fromSnapshot(DocumentSnapshot snapshot) => MyListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyListRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class MyListRecordDocumentEquality implements Equality<MyListRecord> {
  const MyListRecordDocumentEquality();

  @override
  bool equals(MyListRecord? e1, MyListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.favouriteMovies, e2?.favouriteMovies) &&
        listEquality.equals(e1?.favouritePictures, e2?.favouritePictures);
  }

  @override
  int hash(MyListRecord? e) =>
      const ListEquality().hash([e?.favouriteMovies, e?.favouritePictures]);

  @override
  bool isValidKey(Object? o) => o is MyListRecord;
}
