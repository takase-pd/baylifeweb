// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersRecord> _$ordersRecordSerializer =
    new _$OrdersRecordSerializer();

class _$OrdersRecordSerializer implements StructuredSerializer<OrdersRecord> {
  @override
  final Iterable<Type> types = const [OrdersRecord, _$OrdersRecord];
  @override
  final String wireName = 'OrdersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, OrdersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.customer;
    if (value != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.purchased;
    if (value != null) {
      result
        ..add('purchased')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.totalAmount;
    if (value != null) {
      result
        ..add('total_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalQuantity;
    if (value != null) {
      result
        ..add('total_quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalShippingFee;
    if (value != null) {
      result
        ..add('total_shippingFee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
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
    value = object.indivShipping;
    if (value != null) {
      result
        ..add('indiv_shipping')
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
  OrdersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'customer':
          result.customer = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'purchased':
          result.purchased = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'total_amount':
          result.totalAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_quantity':
          result.totalQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_shippingFee':
          result.totalShippingFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated':
          result.updated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'indiv_shipping':
          result.indivShipping = serializers.deserialize(value,
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

class _$OrdersRecord extends OrdersRecord {
  @override
  final DocumentReference<Object> customer;
  @override
  final DateTime purchased;
  @override
  final int totalAmount;
  @override
  final int totalQuantity;
  @override
  final int totalShippingFee;
  @override
  final String status;
  @override
  final String note;
  @override
  final DateTime updated;
  @override
  final bool indivShipping;
  @override
  final DocumentReference<Object> reference;

  factory _$OrdersRecord([void Function(OrdersRecordBuilder) updates]) =>
      (new OrdersRecordBuilder()..update(updates)).build();

  _$OrdersRecord._(
      {this.customer,
      this.purchased,
      this.totalAmount,
      this.totalQuantity,
      this.totalShippingFee,
      this.status,
      this.note,
      this.updated,
      this.indivShipping,
      this.reference})
      : super._();

  @override
  OrdersRecord rebuild(void Function(OrdersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersRecordBuilder toBuilder() => new OrdersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersRecord &&
        customer == other.customer &&
        purchased == other.purchased &&
        totalAmount == other.totalAmount &&
        totalQuantity == other.totalQuantity &&
        totalShippingFee == other.totalShippingFee &&
        status == other.status &&
        note == other.note &&
        updated == other.updated &&
        indivShipping == other.indivShipping &&
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
                                    $jc($jc(0, customer.hashCode),
                                        purchased.hashCode),
                                    totalAmount.hashCode),
                                totalQuantity.hashCode),
                            totalShippingFee.hashCode),
                        status.hashCode),
                    note.hashCode),
                updated.hashCode),
            indivShipping.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersRecord')
          ..add('customer', customer)
          ..add('purchased', purchased)
          ..add('totalAmount', totalAmount)
          ..add('totalQuantity', totalQuantity)
          ..add('totalShippingFee', totalShippingFee)
          ..add('status', status)
          ..add('note', note)
          ..add('updated', updated)
          ..add('indivShipping', indivShipping)
          ..add('reference', reference))
        .toString();
  }
}

class OrdersRecordBuilder
    implements Builder<OrdersRecord, OrdersRecordBuilder> {
  _$OrdersRecord _$v;

  DocumentReference<Object> _customer;
  DocumentReference<Object> get customer => _$this._customer;
  set customer(DocumentReference<Object> customer) =>
      _$this._customer = customer;

  DateTime _purchased;
  DateTime get purchased => _$this._purchased;
  set purchased(DateTime purchased) => _$this._purchased = purchased;

  int _totalAmount;
  int get totalAmount => _$this._totalAmount;
  set totalAmount(int totalAmount) => _$this._totalAmount = totalAmount;

  int _totalQuantity;
  int get totalQuantity => _$this._totalQuantity;
  set totalQuantity(int totalQuantity) => _$this._totalQuantity = totalQuantity;

  int _totalShippingFee;
  int get totalShippingFee => _$this._totalShippingFee;
  set totalShippingFee(int totalShippingFee) =>
      _$this._totalShippingFee = totalShippingFee;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  DateTime _updated;
  DateTime get updated => _$this._updated;
  set updated(DateTime updated) => _$this._updated = updated;

  bool _indivShipping;
  bool get indivShipping => _$this._indivShipping;
  set indivShipping(bool indivShipping) =>
      _$this._indivShipping = indivShipping;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrdersRecordBuilder() {
    OrdersRecord._initializeBuilder(this);
  }

  OrdersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customer = $v.customer;
      _purchased = $v.purchased;
      _totalAmount = $v.totalAmount;
      _totalQuantity = $v.totalQuantity;
      _totalShippingFee = $v.totalShippingFee;
      _status = $v.status;
      _note = $v.note;
      _updated = $v.updated;
      _indivShipping = $v.indivShipping;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersRecord;
  }

  @override
  void update(void Function(OrdersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersRecord build() {
    final _$result = _$v ??
        new _$OrdersRecord._(
            customer: customer,
            purchased: purchased,
            totalAmount: totalAmount,
            totalQuantity: totalQuantity,
            totalShippingFee: totalShippingFee,
            status: status,
            note: note,
            updated: updated,
            indivShipping: indivShipping,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
