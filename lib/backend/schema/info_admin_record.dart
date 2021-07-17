import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'info_admin_record.g.dart';

abstract class InfoAdminRecord
    implements Built<InfoAdminRecord, InfoAdminRecordBuilder> {
  static Serializer<InfoAdminRecord> get serializer =>
      _$infoAdminRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'post_info')
  String get postInfo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InfoAdminRecordBuilder builder) =>
      builder..postInfo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('info_admin');

  static Stream<InfoAdminRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InfoAdminRecord._();
  factory InfoAdminRecord([void Function(InfoAdminRecordBuilder) updates]) =
      _$InfoAdminRecord;

  static InfoAdminRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createInfoAdminRecordData({
  String postInfo,
}) =>
    serializers.toFirestore(InfoAdminRecord.serializer,
        InfoAdminRecord((i) => i..postInfo = postInfo));
