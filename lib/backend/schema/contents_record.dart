import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contents_record.g.dart';

abstract class ContentsRecord
    implements Built<ContentsRecord, ContentsRecordBuilder> {
  static Serializer<ContentsRecord> get serializer =>
      _$contentsRecordSerializer;

  @nullable
  DocumentReference get category;

  @nullable
  @BuiltValueField(wireName: 'cat_add')
  String get catAdd;

  @nullable
  String get title;

  @nullable
  String get overview;

  @nullable
  String get detail;

  @nullable
  @BuiltValueField(wireName: 'start_day')
  DateTime get startDay;

  @nullable
  @BuiltValueField(wireName: 'final_day')
  DateTime get finalDay;

  @nullable
  String get address;

  @nullable
  String get organizer;

  @nullable
  String get contact;

  @nullable
  String get homepage;

  @nullable
  bool get permission;

  @nullable
  bool get display;

  @nullable
  DateTime get posted;

  @nullable
  BuiltList<String> get bccUids;

  @nullable
  String get to;

  @nullable
  DocumentReference get uid;

  @nullable
  String get postRemarks;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContentsRecordBuilder builder) => builder
    ..catAdd = ''
    ..title = ''
    ..overview = ''
    ..detail = ''
    ..address = ''
    ..organizer = ''
    ..contact = ''
    ..homepage = ''
    ..permission = false
    ..display = false
    ..bccUids = ListBuilder()
    ..to = ''
    ..postRemarks = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ContentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContentsRecord._();
  factory ContentsRecord([void Function(ContentsRecordBuilder) updates]) =
      _$ContentsRecord;

  static ContentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createContentsRecordData({
  DocumentReference category,
  String catAdd,
  String title,
  String overview,
  String detail,
  DateTime startDay,
  DateTime finalDay,
  String address,
  String organizer,
  String contact,
  String homepage,
  bool permission,
  bool display,
  DateTime posted,
  String to,
  DocumentReference uid,
  String postRemarks,
}) =>
    serializers.toFirestore(
        ContentsRecord.serializer,
        ContentsRecord((c) => c
          ..category = category
          ..catAdd = catAdd
          ..title = title
          ..overview = overview
          ..detail = detail
          ..startDay = startDay
          ..finalDay = finalDay
          ..address = address
          ..organizer = organizer
          ..contact = contact
          ..homepage = homepage
          ..permission = permission
          ..display = display
          ..posted = posted
          ..bccUids = null
          ..to = to
          ..uid = uid
          ..postRemarks = postRemarks));
