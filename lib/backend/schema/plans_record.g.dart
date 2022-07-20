// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlansRecord> _$plansRecordSerializer = new _$PlansRecordSerializer();

class _$PlansRecordSerializer implements StructuredSerializer<PlansRecord> {
  @override
  final Iterable<Type> types = const [PlansRecord, _$PlansRecord];
  @override
  final String wireName = 'PlansRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PlansRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.activeQuick;
    if (value != null) {
      result
        ..add('active_quick')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.published;
    if (value != null) {
      result
        ..add('published')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.quantityMax;
    if (value != null) {
      result
        ..add('quantity_max')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shippingEachFee;
    if (value != null) {
      result
        ..add('shipping_each_fee')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shippingQuick;
    if (value != null) {
      result
        ..add('shipping_quick')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shop;
    if (value != null) {
      result
        ..add('shop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.unitAmount;
    if (value != null) {
      result
        ..add('unit_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shippingFeeNormal;
    if (value != null) {
      result
        ..add('shipping_fee_normal')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shippingNormal;
    if (value != null) {
      result
        ..add('shipping_normal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updated;
    if (value != null) {
      result
        ..add('updated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.verifyAge;
    if (value != null) {
      result
        ..add('verify_age')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  PlansRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlansRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'active_quick':
          result.activeQuick = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'published':
          result.published = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'quantity_max':
          result.quantityMax = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipping_each_fee':
          result.shippingEachFee = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'shipping_quick':
          result.shippingQuick = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shop':
          result.shop = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'unit_amount':
          result.unitAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipping_fee_normal':
          result.shippingFeeNormal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipping_normal':
          result.shippingNormal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated':
          result.updated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'verify_age':
          result.verifyAge = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$PlansRecord extends PlansRecord {
  @override
  final bool active;
  @override
  final bool activeQuick;
  @override
  final String banner;
  @override
  final String description;
  @override
  final String name;
  @override
  final DateTime published;
  @override
  final int quantityMax;
  @override
  final bool shippingEachFee;
  @override
  final String shippingQuick;
  @override
  final DocumentReference<Object> shop;
  @override
  final int unitAmount;
  @override
  final int shippingFeeNormal;
  @override
  final String shippingNormal;
  @override
  final DateTime updated;
  @override
  final bool verifyAge;
  @override
  final DocumentReference<Object> reference;

  factory _$PlansRecord([void Function(PlansRecordBuilder) updates]) =>
      (new PlansRecordBuilder()..update(updates)).build();

  _$PlansRecord._(
      {this.active,
      this.activeQuick,
      this.banner,
      this.description,
      this.name,
      this.published,
      this.quantityMax,
      this.shippingEachFee,
      this.shippingQuick,
      this.shop,
      this.unitAmount,
      this.shippingFeeNormal,
      this.shippingNormal,
      this.updated,
      this.verifyAge,
      this.reference})
      : super._();

  @override
  PlansRecord rebuild(void Function(PlansRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlansRecordBuilder toBuilder() => new PlansRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlansRecord &&
        active == other.active &&
        activeQuick == other.activeQuick &&
        banner == other.banner &&
        description == other.description &&
        name == other.name &&
        published == other.published &&
        quantityMax == other.quantityMax &&
        shippingEachFee == other.shippingEachFee &&
        shippingQuick == other.shippingQuick &&
        shop == other.shop &&
        unitAmount == other.unitAmount &&
        shippingFeeNormal == other.shippingFeeNormal &&
        shippingNormal == other.shippingNormal &&
        updated == other.updated &&
        verifyAge == other.verifyAge &&
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
                                                                    0,
                                                                    active
                                                                        .hashCode),
                                                                activeQuick
                                                                    .hashCode),
                                                            banner.hashCode),
                                                        description.hashCode),
                                                    name.hashCode),
                                                published.hashCode),
                                            quantityMax.hashCode),
                                        shippingEachFee.hashCode),
                                    shippingQuick.hashCode),
                                shop.hashCode),
                            unitAmount.hashCode),
                        shippingFeeNormal.hashCode),
                    shippingNormal.hashCode),
                updated.hashCode),
            verifyAge.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlansRecord')
          ..add('active', active)
          ..add('activeQuick', activeQuick)
          ..add('banner', banner)
          ..add('description', description)
          ..add('name', name)
          ..add('published', published)
          ..add('quantityMax', quantityMax)
          ..add('shippingEachFee', shippingEachFee)
          ..add('shippingQuick', shippingQuick)
          ..add('shop', shop)
          ..add('unitAmount', unitAmount)
          ..add('shippingFeeNormal', shippingFeeNormal)
          ..add('shippingNormal', shippingNormal)
          ..add('updated', updated)
          ..add('verifyAge', verifyAge)
          ..add('reference', reference))
        .toString();
  }
}

class PlansRecordBuilder implements Builder<PlansRecord, PlansRecordBuilder> {
  _$PlansRecord _$v;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  bool _activeQuick;
  bool get activeQuick => _$this._activeQuick;
  set activeQuick(bool activeQuick) => _$this._activeQuick = activeQuick;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DateTime _published;
  DateTime get published => _$this._published;
  set published(DateTime published) => _$this._published = published;

  int _quantityMax;
  int get quantityMax => _$this._quantityMax;
  set quantityMax(int quantityMax) => _$this._quantityMax = quantityMax;

  bool _shippingEachFee;
  bool get shippingEachFee => _$this._shippingEachFee;
  set shippingEachFee(bool shippingEachFee) =>
      _$this._shippingEachFee = shippingEachFee;

  String _shippingQuick;
  String get shippingQuick => _$this._shippingQuick;
  set shippingQuick(String shippingQuick) =>
      _$this._shippingQuick = shippingQuick;

  DocumentReference<Object> _shop;
  DocumentReference<Object> get shop => _$this._shop;
  set shop(DocumentReference<Object> shop) => _$this._shop = shop;

  int _unitAmount;
  int get unitAmount => _$this._unitAmount;
  set unitAmount(int unitAmount) => _$this._unitAmount = unitAmount;

  int _shippingFeeNormal;
  int get shippingFeeNormal => _$this._shippingFeeNormal;
  set shippingFeeNormal(int shippingFeeNormal) =>
      _$this._shippingFeeNormal = shippingFeeNormal;

  String _shippingNormal;
  String get shippingNormal => _$this._shippingNormal;
  set shippingNormal(String shippingNormal) =>
      _$this._shippingNormal = shippingNormal;

  DateTime _updated;
  DateTime get updated => _$this._updated;
  set updated(DateTime updated) => _$this._updated = updated;

  bool _verifyAge;
  bool get verifyAge => _$this._verifyAge;
  set verifyAge(bool verifyAge) => _$this._verifyAge = verifyAge;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PlansRecordBuilder() {
    PlansRecord._initializeBuilder(this);
  }

  PlansRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _active = $v.active;
      _activeQuick = $v.activeQuick;
      _banner = $v.banner;
      _description = $v.description;
      _name = $v.name;
      _published = $v.published;
      _quantityMax = $v.quantityMax;
      _shippingEachFee = $v.shippingEachFee;
      _shippingQuick = $v.shippingQuick;
      _shop = $v.shop;
      _unitAmount = $v.unitAmount;
      _shippingFeeNormal = $v.shippingFeeNormal;
      _shippingNormal = $v.shippingNormal;
      _updated = $v.updated;
      _verifyAge = $v.verifyAge;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlansRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlansRecord;
  }

  @override
  void update(void Function(PlansRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlansRecord build() {
    final _$result = _$v ??
        new _$PlansRecord._(
            active: active,
            activeQuick: activeQuick,
            banner: banner,
            description: description,
            name: name,
            published: published,
            quantityMax: quantityMax,
            shippingEachFee: shippingEachFee,
            shippingQuick: shippingQuick,
            shop: shop,
            unitAmount: unitAmount,
            shippingFeeNormal: shippingFeeNormal,
            shippingNormal: shippingNormal,
            updated: updated,
            verifyAge: verifyAge,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
