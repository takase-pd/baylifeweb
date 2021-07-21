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
  String get title;

  @nullable
  DateTime get posted;

  @nullable
  bool get display;

  @nullable
  DocumentReference get category;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContentsRecordBuilder builder) => builder
    ..title = ''
    ..display = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContentsRecord._();
  factory ContentsRecord([void Function(ContentsRecordBuilder) updates]) =
      _$ContentsRecord;

  static ContentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createContentsRecordData({
  String title,
  DateTime posted,
  bool display,
  DocumentReference category,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        ContentsRecord.serializer,
        ContentsRecord((c) => c
          ..title = title
          ..posted = posted
          ..display = display
          ..category = category
          ..user = user));
