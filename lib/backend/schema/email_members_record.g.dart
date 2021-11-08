// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_members_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmailMembersRecord> _$emailMembersRecordSerializer =
    new _$EmailMembersRecordSerializer();

class _$EmailMembersRecordSerializer
    implements StructuredSerializer<EmailMembersRecord> {
  @override
  final Iterable<Type> types = const [EmailMembersRecord, _$EmailMembersRecord];
  @override
  final String wireName = 'EmailMembersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, EmailMembersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  EmailMembersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmailMembersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$EmailMembersRecord extends EmailMembersRecord {
  @override
  final String email;
  @override
  final DocumentReference<Object> reference;

  factory _$EmailMembersRecord(
          [void Function(EmailMembersRecordBuilder) updates]) =>
      (new EmailMembersRecordBuilder()..update(updates)).build();

  _$EmailMembersRecord._({this.email, this.reference}) : super._();

  @override
  EmailMembersRecord rebuild(
          void Function(EmailMembersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailMembersRecordBuilder toBuilder() =>
      new EmailMembersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailMembersRecord &&
        email == other.email &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EmailMembersRecord')
          ..add('email', email)
          ..add('reference', reference))
        .toString();
  }
}

class EmailMembersRecordBuilder
    implements Builder<EmailMembersRecord, EmailMembersRecordBuilder> {
  _$EmailMembersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EmailMembersRecordBuilder() {
    EmailMembersRecord._initializeBuilder(this);
  }

  EmailMembersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmailMembersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmailMembersRecord;
  }

  @override
  void update(void Function(EmailMembersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EmailMembersRecord build() {
    final _$result =
        _$v ?? new _$EmailMembersRecord._(email: email, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
