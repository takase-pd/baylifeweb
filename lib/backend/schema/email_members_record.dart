import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'email_members_record.g.dart';

abstract class EmailMembersRecord
    implements Built<EmailMembersRecord, EmailMembersRecordBuilder> {
  static Serializer<EmailMembersRecord> get serializer =>
      _$emailMembersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EmailMembersRecordBuilder builder) =>
      builder..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('email_members');

  static Stream<EmailMembersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EmailMembersRecord._();
  factory EmailMembersRecord(
          [void Function(EmailMembersRecordBuilder) updates]) =
      _$EmailMembersRecord;

  static EmailMembersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEmailMembersRecordData({
  String email,
}) =>
    serializers.toFirestore(EmailMembersRecord.serializer,
        EmailMembersRecord((e) => e..email = email));
