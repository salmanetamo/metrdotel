// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as String,
    restaurantId: json['restaurantId'] as String,
    userId: json['userId'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    discount: (json['discount'] as num).toDouble(),
    waiterTip: (json['waiterTip'] as num).toDouble(),
    dateTime: DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'userId': instance.userId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'discount': instance.discount,
      'waiterTip': instance.waiterTip,
      'dateTime': instance.dateTime.toIso8601String(),
    };
