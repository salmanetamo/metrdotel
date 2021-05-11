import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final String id;
  final String menuItemId;
  final String orderId;
  final int quantity;

  OrderItem({
    this.id,
    this.menuItemId,
    this.orderId,
    this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
