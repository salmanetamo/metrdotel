// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    id: json['id'] as String,
    menuItemId: json['menuItemId'] as String,
    orderId: json['orderId'] as String,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'menuItemId': instance.menuItemId,
      'orderId': instance.orderId,
      'quantity': instance.quantity,
    };
