import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shops_record.g.dart';

abstract class ShopsRecord implements Built<ShopsRecord, ShopsRecordBuilder> {
  static Serializer<ShopsRecord> get serializer => _$shopsRecordSerializer;

  @nullable
  String get banner;

  @nullable
  @BuiltValueField(wireName: 'cat_main')
  DocumentReference get catMain;

  @nullable
  DocumentReference get company;

  @nullable
  String get description;

  @nullable
  bool get display;

  @nullable
  String get email;

  @nullable
  String get instagram;

  @nullable
  String get phone;

  @nullable
  @BuiltValueField(wireName: 'shipping_fee')
  int get shippingFee;

  @nullable
  @BuiltValueField(wireName: 'shipping_free_total')
  int get shippingFreeTotal;

  @nullable
  @BuiltValueField(wireName: 'shop_name')
  String get shopName;

  @nullable
  String get twitter;

  @nullable
  String get web;

  @nullable
  DocumentReference get director;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShopsRecordBuilder builder) => builder
    ..banner = ''
    ..description = ''
    ..display = false
    ..email = ''
    ..instagram = ''
    ..phone = ''
    ..shippingFee = 0
    ..shippingFreeTotal = 0
    ..shopName = ''
    ..twitter = ''
    ..web = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shops');

  static Stream<ShopsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ShopsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShopsRecord._();
  factory ShopsRecord([void Function(ShopsRecordBuilder) updates]) =
      _$ShopsRecord;

  static ShopsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShopsRecordData({
  String banner,
  DocumentReference catMain,
  DocumentReference company,
  String description,
  bool display,
  String email,
  String instagram,
  String phone,
  int shippingFee,
  int shippingFreeTotal,
  String shopName,
  String twitter,
  String web,
  DocumentReference director,
}) =>
    serializers.toFirestore(
        ShopsRecord.serializer,
        ShopsRecord((s) => s
          ..banner = banner
          ..catMain = catMain
          ..company = company
          ..description = description
          ..display = display
          ..email = email
          ..instagram = instagram
          ..phone = phone
          ..shippingFee = shippingFee
          ..shippingFreeTotal = shippingFreeTotal
          ..shopName = shopName
          ..twitter = twitter
          ..web = web
          ..director = director));
