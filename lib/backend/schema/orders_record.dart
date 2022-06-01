import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_record.g.dart';

abstract class OrdersRecord
    implements Built<OrdersRecord, OrdersRecordBuilder> {
  static Serializer<OrdersRecord> get serializer => _$ordersRecordSerializer;

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
  String get note;

  @nullable
  DateTime get updated;

  @nullable
  String get carrier;

  @nullable
  @BuiltValueField(wireName: 'tracking_number')
  String get trackingNumber;

  @nullable
  @BuiltValueField(wireName: 'tracking_index')
  int get trackingIndex;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(OrdersRecordBuilder builder) => builder
    ..totalAmount = 0
    ..totalQuantity = 0
    ..totalShippingFee = 0
    ..status = ''
    ..note = ''
    ..carrier = ''
    ..trackingNumber = ''
    ..trackingIndex = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersRecord._();
  factory OrdersRecord([void Function(OrdersRecordBuilder) updates]) =
      _$OrdersRecord;

  static OrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference customer,
  DateTime purchased,
  int totalAmount,
  int totalQuantity,
  int totalShippingFee,
  String status,
  String note,
  DateTime updated,
  String carrier,
  String trackingNumber,
  int trackingIndex,
}) =>
    serializers.toFirestore(
        OrdersRecord.serializer,
        OrdersRecord((o) => o
          ..customer = customer
          ..purchased = purchased
          ..totalAmount = totalAmount
          ..totalQuantity = totalQuantity
          ..totalShippingFee = totalShippingFee
          ..status = status
          ..note = note
          ..updated = updated
          ..carrier = carrier
          ..trackingNumber = trackingNumber
          ..trackingIndex = trackingIndex));
