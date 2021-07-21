// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContentsRecord> _$contentsRecordSerializer =
    new _$ContentsRecordSerializer();

class _$ContentsRecordSerializer
    implements StructuredSerializer<ContentsRecord> {
  @override
  final Iterable<Type> types = const [ContentsRecord, _$ContentsRecord];
  @override
  final String wireName = 'ContentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ContentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posted;
    if (value != null) {
      result
        ..add('posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  ContentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'posted':
          result.posted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$ContentsRecord extends ContentsRecord {
  @override
  final String title;
  @override
  final DateTime posted;
  @override
  final bool display;
  @override
  final DocumentReference<Object> category;
  @override
  final DocumentReference<Object> user;
  @override
  final DocumentReference<Object> reference;

  factory _$ContentsRecord([void Function(ContentsRecordBuilder) updates]) =>
      (new ContentsRecordBuilder()..update(updates)).build();

  _$ContentsRecord._(
      {this.title,
      this.posted,
      this.display,
      this.category,
      this.user,
      this.reference})
      : super._();

  @override
  ContentsRecord rebuild(void Function(ContentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentsRecordBuilder toBuilder() =>
      new ContentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentsRecord &&
        title == other.title &&
        posted == other.posted &&
        display == other.display &&
        category == other.category &&
        user == other.user &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), posted.hashCode),
                    display.hashCode),
                category.hashCode),
            user.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentsRecord')
          ..add('title', title)
          ..add('posted', posted)
          ..add('display', display)
          ..add('category', category)
          ..add('user', user)
          ..add('reference', reference))
        .toString();
  }
}

class ContentsRecordBuilder
    implements Builder<ContentsRecord, ContentsRecordBuilder> {
  _$ContentsRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DateTime _posted;
  DateTime get posted => _$this._posted;
  set posted(DateTime posted) => _$this._posted = posted;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  DocumentReference<Object> _category;
  DocumentReference<Object> get category => _$this._category;
  set category(DocumentReference<Object> category) =>
      _$this._category = category;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ContentsRecordBuilder() {
    ContentsRecord._initializeBuilder(this);
  }

  ContentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _posted = $v.posted;
      _display = $v.display;
      _category = $v.category;
      _user = $v.user;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContentsRecord;
  }

  @override
  void update(void Function(ContentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContentsRecord build() {
    final _$result = _$v ??
        new _$ContentsRecord._(
            title: title,
            posted: posted,
            display: display,
            category: category,
            user: user,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
