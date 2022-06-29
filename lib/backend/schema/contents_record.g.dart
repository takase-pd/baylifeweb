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
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.catAdd;
    if (value != null) {
      result
        ..add('cat_add')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDay;
    if (value != null) {
      result
        ..add('start_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.finalDay;
    if (value != null) {
      result
        ..add('final_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organizer;
    if (value != null) {
      result
        ..add('organizer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homepage;
    if (value != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.permission;
    if (value != null) {
      result
        ..add('permission')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.posted;
    if (value != null) {
      result
        ..add('posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bccUids;
    if (value != null) {
      result
        ..add('bccUids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.postRemarks;
    if (value != null) {
      result
        ..add('postRemarks')
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
        case 'category':
          result.category = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'cat_add':
          result.catAdd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'start_day':
          result.startDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'final_day':
          result.finalDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organizer':
          result.organizer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'permission':
          result.permission = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'posted':
          result.posted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'bccUids':
          result.bccUids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'postRemarks':
          result.postRemarks = serializers.deserialize(value,
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

class _$ContentsRecord extends ContentsRecord {
  @override
  final DocumentReference<Object> category;
  @override
  final String catAdd;
  @override
  final String title;
  @override
  final String overview;
  @override
  final String detail;
  @override
  final DateTime startDay;
  @override
  final DateTime finalDay;
  @override
  final String address;
  @override
  final String organizer;
  @override
  final String contact;
  @override
  final String homepage;
  @override
  final bool permission;
  @override
  final bool display;
  @override
  final DateTime posted;
  @override
  final BuiltList<String> bccUids;
  @override
  final String to;
  @override
  final DocumentReference<Object> uid;
  @override
  final String postRemarks;
  @override
  final DocumentReference<Object> reference;

  factory _$ContentsRecord([void Function(ContentsRecordBuilder) updates]) =>
      (new ContentsRecordBuilder()..update(updates)).build();

  _$ContentsRecord._(
      {this.category,
      this.catAdd,
      this.title,
      this.overview,
      this.detail,
      this.startDay,
      this.finalDay,
      this.address,
      this.organizer,
      this.contact,
      this.homepage,
      this.permission,
      this.display,
      this.posted,
      this.bccUids,
      this.to,
      this.uid,
      this.postRemarks,
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
        category == other.category &&
        catAdd == other.catAdd &&
        title == other.title &&
        overview == other.overview &&
        detail == other.detail &&
        startDay == other.startDay &&
        finalDay == other.finalDay &&
        address == other.address &&
        organizer == other.organizer &&
        contact == other.contact &&
        homepage == other.homepage &&
        permission == other.permission &&
        display == other.display &&
        posted == other.posted &&
        bccUids == other.bccUids &&
        to == other.to &&
        uid == other.uid &&
        postRemarks == other.postRemarks &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                category
                                                                                    .hashCode),
                                                                            catAdd
                                                                                .hashCode),
                                                                        title
                                                                            .hashCode),
                                                                    overview
                                                                        .hashCode),
                                                                detail
                                                                    .hashCode),
                                                            startDay.hashCode),
                                                        finalDay.hashCode),
                                                    address.hashCode),
                                                organizer.hashCode),
                                            contact.hashCode),
                                        homepage.hashCode),
                                    permission.hashCode),
                                display.hashCode),
                            posted.hashCode),
                        bccUids.hashCode),
                    to.hashCode),
                uid.hashCode),
            postRemarks.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentsRecord')
          ..add('category', category)
          ..add('catAdd', catAdd)
          ..add('title', title)
          ..add('overview', overview)
          ..add('detail', detail)
          ..add('startDay', startDay)
          ..add('finalDay', finalDay)
          ..add('address', address)
          ..add('organizer', organizer)
          ..add('contact', contact)
          ..add('homepage', homepage)
          ..add('permission', permission)
          ..add('display', display)
          ..add('posted', posted)
          ..add('bccUids', bccUids)
          ..add('to', to)
          ..add('uid', uid)
          ..add('postRemarks', postRemarks)
          ..add('reference', reference))
        .toString();
  }
}

class ContentsRecordBuilder
    implements Builder<ContentsRecord, ContentsRecordBuilder> {
  _$ContentsRecord _$v;

  DocumentReference<Object> _category;
  DocumentReference<Object> get category => _$this._category;
  set category(DocumentReference<Object> category) =>
      _$this._category = category;

  String _catAdd;
  String get catAdd => _$this._catAdd;
  set catAdd(String catAdd) => _$this._catAdd = catAdd;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  DateTime _startDay;
  DateTime get startDay => _$this._startDay;
  set startDay(DateTime startDay) => _$this._startDay = startDay;

  DateTime _finalDay;
  DateTime get finalDay => _$this._finalDay;
  set finalDay(DateTime finalDay) => _$this._finalDay = finalDay;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _organizer;
  String get organizer => _$this._organizer;
  set organizer(String organizer) => _$this._organizer = organizer;

  String _contact;
  String get contact => _$this._contact;
  set contact(String contact) => _$this._contact = contact;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  bool _permission;
  bool get permission => _$this._permission;
  set permission(bool permission) => _$this._permission = permission;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  DateTime _posted;
  DateTime get posted => _$this._posted;
  set posted(DateTime posted) => _$this._posted = posted;

  ListBuilder<String> _bccUids;
  ListBuilder<String> get bccUids =>
      _$this._bccUids ??= new ListBuilder<String>();
  set bccUids(ListBuilder<String> bccUids) => _$this._bccUids = bccUids;

  String _to;
  String get to => _$this._to;
  set to(String to) => _$this._to = to;

  DocumentReference<Object> _uid;
  DocumentReference<Object> get uid => _$this._uid;
  set uid(DocumentReference<Object> uid) => _$this._uid = uid;

  String _postRemarks;
  String get postRemarks => _$this._postRemarks;
  set postRemarks(String postRemarks) => _$this._postRemarks = postRemarks;

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
      _category = $v.category;
      _catAdd = $v.catAdd;
      _title = $v.title;
      _overview = $v.overview;
      _detail = $v.detail;
      _startDay = $v.startDay;
      _finalDay = $v.finalDay;
      _address = $v.address;
      _organizer = $v.organizer;
      _contact = $v.contact;
      _homepage = $v.homepage;
      _permission = $v.permission;
      _display = $v.display;
      _posted = $v.posted;
      _bccUids = $v.bccUids?.toBuilder();
      _to = $v.to;
      _uid = $v.uid;
      _postRemarks = $v.postRemarks;
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
    _$ContentsRecord _$result;
    try {
      _$result = _$v ??
          new _$ContentsRecord._(
              category: category,
              catAdd: catAdd,
              title: title,
              overview: overview,
              detail: detail,
              startDay: startDay,
              finalDay: finalDay,
              address: address,
              organizer: organizer,
              contact: contact,
              homepage: homepage,
              permission: permission,
              display: display,
              posted: posted,
              bccUids: _bccUids?.build(),
              to: to,
              uid: uid,
              postRemarks: postRemarks,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bccUids';
        _bccUids?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
