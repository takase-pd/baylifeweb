import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'plans_record.g.dart';

abstract class PlansRecord implements Built<PlansRecord, PlansRecordBuilder> {
  static Serializer<PlansRecord> get serializer => _$plansRecordSerializer;

  @nullable
  bool get active;

  @nullable
  @BuiltValueField(wireName: 'active_quick')
  bool get activeQuick;

  @nullable
  String get banner;

  @nullable
  String get description;

  @nullable
  String get name;

  @nullable
  DateTime get published;

  @nullable
  @BuiltValueField(wireName: 'quantity_max')
  int get quantityMax;

  @nullable
  @BuiltValueField(wireName: 'shipping_each_fee')
  bool get shippingEachFee;

  @nullable
  @BuiltValueField(wireName: 'shipping_quick')
  String get shippingQuick;

  @nullable
  DocumentReference get shop;

  @nullable
  @BuiltValueField(wireName: 'unit_amount')
  int get unitAmount;

  @nullable
  @BuiltValueField(wireName: 'shipping_fee_normal')
  int get shippingFeeNormal;

  @nullable
  @BuiltValueField(wireName: 'shipping_normal')
  String get shippingNormal;

  @nullable
  DateTime get updated;

  @nullable
  @BuiltValueField(wireName: 'verify_age')
  bool get verifyAge;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PlansRecordBuilder builder) => builder
    ..active = false
    ..activeQuick = false
    ..banner = ''
    ..description = ''
    ..name = ''
    ..quantityMax = 0
    ..shippingEachFee = false
    ..shippingQuick = ''
    ..unitAmount = 0
    ..shippingFeeNormal = 0
    ..shippingNormal = ''
    ..verifyAge = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PlansRecord._();
  factory PlansRecord([void Function(PlansRecordBuilder) updates]) =
      _$PlansRecord;

  static PlansRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPlansRecordData({
  bool active,
  bool activeQuick,
  String banner,
  String description,
  String name,
  DateTime published,
  int quantityMax,
  bool shippingEachFee,
  String shippingQuick,
  DocumentReference shop,
  int unitAmount,
  int shippingFeeNormal,
  String shippingNormal,
  DateTime updated,
  bool verifyAge,
}) =>
    serializers.toFirestore(
        PlansRecord.serializer,
        PlansRecord((p) => p
          ..active = active
          ..activeQuick = activeQuick
          ..banner = banner
          ..description = description
          ..name = name
          ..published = published
          ..quantityMax = quantityMax
          ..shippingEachFee = shippingEachFee
          ..shippingQuick = shippingQuick
          ..shop = shop
          ..unitAmount = unitAmount
          ..shippingFeeNormal = shippingFeeNormal
          ..shippingNormal = shippingNormal
          ..updated = updated
          ..verifyAge = verifyAge));
