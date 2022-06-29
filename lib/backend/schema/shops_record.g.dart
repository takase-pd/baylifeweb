// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShopsRecord> _$shopsRecordSerializer = new _$ShopsRecordSerializer();

class _$ShopsRecordSerializer implements StructuredSerializer<ShopsRecord> {
  @override
  final Iterable<Type> types = const [ShopsRecord, _$ShopsRecord];
  @override
  final String wireName = 'ShopsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ShopsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.catMain;
    if (value != null) {
      result
        ..add('cat_main')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.display;
    if (value != null) {
      result
        ..add('display')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingFee;
    if (value != null) {
      result
        ..add('shipping_fee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shippingFreeTotal;
    if (value != null) {
      result
        ..add('shipping_free_total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shopName;
    if (value != null) {
      result
        ..add('shop_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.twitter;
    if (value != null) {
      result
        ..add('twitter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.web;
    if (value != null) {
      result
        ..add('web')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.director;
    if (value != null) {
      result
        ..add('director')
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
  ShopsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShopsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cat_main':
          result.catMain = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display':
          result.display = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipping_fee':
          result.shippingFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipping_free_total':
          result.shippingFreeTotal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shop_name':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'web':
          result.web = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'director':
          result.director = serializers.deserialize(value,
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

class _$ShopsRecord extends ShopsRecord {
  @override
  final String banner;
  @override
  final DocumentReference<Object> catMain;
  @override
  final DocumentReference<Object> company;
  @override
  final String description;
  @override
  final bool display;
  @override
  final String email;
  @override
  final String instagram;
  @override
  final String phone;
  @override
  final int shippingFee;
  @override
  final int shippingFreeTotal;
  @override
  final String shopName;
  @override
  final String twitter;
  @override
  final String web;
  @override
  final DocumentReference<Object> director;
  @override
  final DocumentReference<Object> reference;

  factory _$ShopsRecord([void Function(ShopsRecordBuilder) updates]) =>
      (new ShopsRecordBuilder()..update(updates)).build();

  _$ShopsRecord._(
      {this.banner,
      this.catMain,
      this.company,
      this.description,
      this.display,
      this.email,
      this.instagram,
      this.phone,
      this.shippingFee,
      this.shippingFreeTotal,
      this.shopName,
      this.twitter,
      this.web,
      this.director,
      this.reference})
      : super._();

  @override
  ShopsRecord rebuild(void Function(ShopsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopsRecordBuilder toBuilder() => new ShopsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopsRecord &&
        banner == other.banner &&
        catMain == other.catMain &&
        company == other.company &&
        description == other.description &&
        display == other.display &&
        email == other.email &&
        instagram == other.instagram &&
        phone == other.phone &&
        shippingFee == other.shippingFee &&
        shippingFreeTotal == other.shippingFreeTotal &&
        shopName == other.shopName &&
        twitter == other.twitter &&
        web == other.web &&
        director == other.director &&
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
                                                                0,
                                                                banner
                                                                    .hashCode),
                                                            catMain.hashCode),
                                                        company.hashCode),
                                                    description.hashCode),
                                                display.hashCode),
                                            email.hashCode),
                                        instagram.hashCode),
                                    phone.hashCode),
                                shippingFee.hashCode),
                            shippingFreeTotal.hashCode),
                        shopName.hashCode),
                    twitter.hashCode),
                web.hashCode),
            director.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShopsRecord')
          ..add('banner', banner)
          ..add('catMain', catMain)
          ..add('company', company)
          ..add('description', description)
          ..add('display', display)
          ..add('email', email)
          ..add('instagram', instagram)
          ..add('phone', phone)
          ..add('shippingFee', shippingFee)
          ..add('shippingFreeTotal', shippingFreeTotal)
          ..add('shopName', shopName)
          ..add('twitter', twitter)
          ..add('web', web)
          ..add('director', director)
          ..add('reference', reference))
        .toString();
  }
}

class ShopsRecordBuilder implements Builder<ShopsRecord, ShopsRecordBuilder> {
  _$ShopsRecord _$v;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  DocumentReference<Object> _catMain;
  DocumentReference<Object> get catMain => _$this._catMain;
  set catMain(DocumentReference<Object> catMain) => _$this._catMain = catMain;

  DocumentReference<Object> _company;
  DocumentReference<Object> get company => _$this._company;
  set company(DocumentReference<Object> company) => _$this._company = company;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _display;
  bool get display => _$this._display;
  set display(bool display) => _$this._display = display;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _instagram;
  String get instagram => _$this._instagram;
  set instagram(String instagram) => _$this._instagram = instagram;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  int _shippingFee;
  int get shippingFee => _$this._shippingFee;
  set shippingFee(int shippingFee) => _$this._shippingFee = shippingFee;

  int _shippingFreeTotal;
  int get shippingFreeTotal => _$this._shippingFreeTotal;
  set shippingFreeTotal(int shippingFreeTotal) =>
      _$this._shippingFreeTotal = shippingFreeTotal;

  String _shopName;
  String get shopName => _$this._shopName;
  set shopName(String shopName) => _$this._shopName = shopName;

  String _twitter;
  String get twitter => _$this._twitter;
  set twitter(String twitter) => _$this._twitter = twitter;

  String _web;
  String get web => _$this._web;
  set web(String web) => _$this._web = web;

  DocumentReference<Object> _director;
  DocumentReference<Object> get director => _$this._director;
  set director(DocumentReference<Object> director) =>
      _$this._director = director;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ShopsRecordBuilder() {
    ShopsRecord._initializeBuilder(this);
  }

  ShopsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _banner = $v.banner;
      _catMain = $v.catMain;
      _company = $v.company;
      _description = $v.description;
      _display = $v.display;
      _email = $v.email;
      _instagram = $v.instagram;
      _phone = $v.phone;
      _shippingFee = $v.shippingFee;
      _shippingFreeTotal = $v.shippingFreeTotal;
      _shopName = $v.shopName;
      _twitter = $v.twitter;
      _web = $v.web;
      _director = $v.director;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShopsRecord;
  }

  @override
  void update(void Function(ShopsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShopsRecord build() {
    final _$result = _$v ??
        new _$ShopsRecord._(
            banner: banner,
            catMain: catMain,
            company: company,
            description: description,
            display: display,
            email: email,
            instagram: instagram,
            phone: phone,
            shippingFee: shippingFee,
            shippingFreeTotal: shippingFreeTotal,
            shopName: shopName,
            twitter: twitter,
            web: web,
            director: director,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
