// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_admin_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InfoAdminRecord> _$infoAdminRecordSerializer =
    new _$InfoAdminRecordSerializer();

class _$InfoAdminRecordSerializer
    implements StructuredSerializer<InfoAdminRecord> {
  @override
  final Iterable<Type> types = const [InfoAdminRecord, _$InfoAdminRecord];
  @override
  final String wireName = 'InfoAdminRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, InfoAdminRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.postInfo;
    if (value != null) {
      result
        ..add('post_info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  InfoAdminRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InfoAdminRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'post_info':
          result.postInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$InfoAdminRecord extends InfoAdminRecord {
  @override
  final String postInfo;
  @override
  final DocumentReference reference;

  factory _$InfoAdminRecord([void Function(InfoAdminRecordBuilder) updates]) =>
      (new InfoAdminRecordBuilder()..update(updates)).build();

  _$InfoAdminRecord._({this.postInfo, this.reference}) : super._();

  @override
  InfoAdminRecord rebuild(void Function(InfoAdminRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InfoAdminRecordBuilder toBuilder() =>
      new InfoAdminRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InfoAdminRecord &&
        postInfo == other.postInfo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, postInfo.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InfoAdminRecord')
          ..add('postInfo', postInfo)
          ..add('reference', reference))
        .toString();
  }
}

class InfoAdminRecordBuilder
    implements Builder<InfoAdminRecord, InfoAdminRecordBuilder> {
  _$InfoAdminRecord _$v;

  String _postInfo;
  String get postInfo => _$this._postInfo;
  set postInfo(String postInfo) => _$this._postInfo = postInfo;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  InfoAdminRecordBuilder() {
    InfoAdminRecord._initializeBuilder(this);
  }

  InfoAdminRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postInfo = $v.postInfo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InfoAdminRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InfoAdminRecord;
  }

  @override
  void update(void Function(InfoAdminRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InfoAdminRecord build() {
    final _$result = _$v ??
        new _$InfoAdminRecord._(postInfo: postInfo, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
