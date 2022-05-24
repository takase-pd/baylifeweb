import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sold_record.g.dart';

abstract class SoldRecord implements Built<SoldRecord, SoldRecordBuilder> {
  static Serializer<SoldRecord> get serializer => _$soldRecordSerializer;

  @nullable
  DocumentReference get customer;

  @nullable
  DateTime get purchased;

  @nullable
  @BuiltValueField(wireName: 'total_amount')
  int get totalAmount;

  @nullable
  @BuiltValueField(wireName: 'total_quantity')
  int get totalQuantity;

  @nullable
  @BuiltValueField(wireName: 'total_shippingFee')
  int get totalShippingFee;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(SoldRecordBuilder builder) => builder
    ..totalAmount = 0
    ..totalQuantity = 0
    ..totalShippingFee = 0
    ..status = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('sold')
          : FirebaseFirestore.instance.collectionGroup('sold');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sold').doc();

  static Stream<SoldRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SoldRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SoldRecord._();
  factory SoldRecord([void Function(SoldRecordBuilder) updates]) = _$SoldRecord;

  static SoldRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSoldRecordData({
  DocumentReference customer,
  DateTime purchased,
  int totalAmount,
  int totalQuantity,
  int totalShippingFee,
  String status,
}) =>
    serializers.toFirestore(
        SoldRecord.serializer,
        SoldRecord((s) => s
          ..customer = customer
          ..purchased = purchased
          ..totalAmount = totalAmount
          ..totalQuantity = totalQuantity
          ..totalShippingFee = totalShippingFee
          ..status = status));
