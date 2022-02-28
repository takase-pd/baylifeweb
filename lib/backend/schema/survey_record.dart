import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'survey_record.g.dart';

abstract class SurveyRecord
    implements Built<SurveyRecord, SurveyRecordBuilder> {
  static Serializer<SurveyRecord> get serializer => _$surveyRecordSerializer;

  @nullable
  BuiltList<String> get choices;

  @nullable
  bool get display;

  @nullable
  String get explanation;

  @nullable
  bool get open;

  @nullable
  String get question;

  @nullable
  DateTime get startDate;

  @nullable
  DateTime get endDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SurveyRecordBuilder builder) => builder
    ..choices = ListBuilder()
    ..display = false
    ..explanation = ''
    ..open = false
    ..question = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('survey');

  static Stream<SurveyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SurveyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SurveyRecord._();
  factory SurveyRecord([void Function(SurveyRecordBuilder) updates]) =
      _$SurveyRecord;

  static SurveyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSurveyRecordData({
  bool display,
  String explanation,
  bool open,
  String question,
  DateTime startDate,
  DateTime endDate,
}) =>
    serializers.toFirestore(
        SurveyRecord.serializer,
        SurveyRecord((s) => s
          ..choices = null
          ..display = display
          ..explanation = explanation
          ..open = open
          ..question = question
          ..startDate = startDate
          ..endDate = endDate));
