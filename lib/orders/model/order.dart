import 'package:json_annotation/json_annotation.dart';

import 'order_item.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  final String id;
  final String restaurantId;
  final String userId;
  final List<OrderItem> items;
  final double discount;
  final double waiterTip;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.restaurantId,
    required this.userId,
    required this.items,
    required this.discount,
    required this.waiterTip,
    required this.dateTime,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
