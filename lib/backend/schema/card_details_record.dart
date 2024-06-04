import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardDetailsRecord extends FirestoreRecord {
  CardDetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "cardNumber" field.
  int? _cardNumber;
  int get cardNumber => _cardNumber ?? 0;
  bool hasCardNumber() => _cardNumber != null;

  // "expireAt" field.
  DateTime? _expireAt;
  DateTime? get expireAt => _expireAt;
  bool hasExpireAt() => _expireAt != null;

  // "craetedAt" field.
  DateTime? _craetedAt;
  DateTime? get craetedAt => _craetedAt;
  bool hasCraetedAt() => _craetedAt != null;

  // "cvc" field.
  int? _cvc;
  int get cvc => _cvc ?? 0;
  bool hasCvc() => _cvc != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _cardNumber = castToType<int>(snapshotData['cardNumber']);
    _expireAt = snapshotData['expireAt'] as DateTime?;
    _craetedAt = snapshotData['craetedAt'] as DateTime?;
    _cvc = castToType<int>(snapshotData['cvc']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cardDetails')
          : FirebaseFirestore.instance.collectionGroup('cardDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cardDetails').doc(id);

  static Stream<CardDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardDetailsRecord.fromSnapshot(s));

  static Future<CardDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardDetailsRecord.fromSnapshot(s));

  static CardDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardDetailsRecordData({
  String? name,
  int? cardNumber,
  DateTime? expireAt,
  DateTime? craetedAt,
  int? cvc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'cardNumber': cardNumber,
      'expireAt': expireAt,
      'craetedAt': craetedAt,
      'cvc': cvc,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardDetailsRecordDocumentEquality implements Equality<CardDetailsRecord> {
  const CardDetailsRecordDocumentEquality();

  @override
  bool equals(CardDetailsRecord? e1, CardDetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.expireAt == e2?.expireAt &&
        e1?.craetedAt == e2?.craetedAt &&
        e1?.cvc == e2?.cvc;
  }

  @override
  int hash(CardDetailsRecord? e) => const ListEquality()
      .hash([e?.name, e?.cardNumber, e?.expireAt, e?.craetedAt, e?.cvc]);

  @override
  bool isValidKey(Object? o) => o is CardDetailsRecord;
}
