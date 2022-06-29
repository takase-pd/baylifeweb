// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SurveyRecord> _$surveyRecordSerializer =
    new _$SurveyRecordSerializer();

class _$SurveyRecordSerializer implements StructuredSerializer<SurveyRecord> {
  @override
  final Iterable<Type> types = const [SurveyRecord, _$SurveyRecord];
  @override
  final String wireName = 'SurveyRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SurveyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.choices;
    if (value != null) {
      result
        ..add('choices')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.explanation;
    if (value != null) {
      result
        ..add('explanation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.open;
    if (value != null) {
      result
        ..add('open')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('startDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('endDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  SurveyRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'choices':
          result.choices.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'explanation':
          result.explanation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'open':
          result.open = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$SurveyRecord extends SurveyRecord {
  @override
  final BuiltList<String> choices;
  @override
  final bool display;
  @override
  final String explanation;
  @override
  final bool open;
  @override
  final String question;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DocumentReference<Object> reference;

  factory _$SurveyRecord([void Function(SurveyRecordBuilder) updates]) =>
      (new SurveyRecordBuilder()..update(updates)).build();

  _$SurveyRecord._(
      {this.choices,
      this.display,
      this.explanation,
      this.open,
      this.question,
      this.startDate,
      this.endDate,
      this.reference})
      : super._();

  @override
  SurveyRecord rebuild(void Function(SurveyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyRecordBuilder toBuilder() => new SurveyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurveyRecord &&
        choices == other.choices &&
        display == other.display &&
        explanation == other.explanation &&
        open == other.open &&
        question == other.question &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, choices.hashCode), display.hashCode),
                            explanation.hashCode),
                        open.hashCode),
                    question.hashCode),
                startDate.hashCode),
            endDate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SurveyRecord')
          ..add('choices', choices)
          ..add('display', display)
          ..add('explanation', explanation)
          ..add('open', open)
          ..add('question', question)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('reference', reference))
        .toString();
  }
}

class SurveyRecordBuilder
    implements Builder<SurveyRecord, SurveyRecordBuilder> {
  _$SurveyRecord _$v;

  ListBuilder<String> _choices;
  ListBuilder<String> get choices =>
      _$this._choices ??= new ListBuilder<String>();
  set choices(ListBuilder<String> choices) => _$this._choices = choices;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  String _explanation;
  String get explanation => _$this._explanation;
  set explanation(String explanation) => _$this._explanation = explanation;

  bool _open;
  bool get open => _$this._open;
  set open(bool open) => _$this._open = open;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SurveyRecordBuilder() {
    SurveyRecord._initializeBuilder(this);
  }

  SurveyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _choices = $v.choices?.toBuilder();
      _display = $v.display;
      _explanation = $v.explanation;
      _open = $v.open;
      _question = $v.question;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurveyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SurveyRecord;
  }

  @override
  void update(void Function(SurveyRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SurveyRecord build() {
    _$SurveyRecord _$result;
    try {
      _$result = _$v ??
          new _$SurveyRecord._(
              choices: _choices?.build(),
              display: display,
              explanation: explanation,
              open: open,
              question: question,
              startDate: startDate,
              endDate: endDate,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'choices';
        _choices?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SurveyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
