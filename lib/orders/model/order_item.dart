import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String id;
  final String menuItemId;
  final String orderId;
  final int quantity;

  OrderItem({
    required this.id,
    required this.menuItemId,
    required this.orderId,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
