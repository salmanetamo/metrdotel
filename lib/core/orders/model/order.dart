import 'package:metrdotel/core/orders/model/order_item.dart';

class Order {
  final String id;
  final String restaurantId;
  final String userId;
  final List<OrderItem> items;
  final double discount;
  final double waiterTip;
  final DateTime dateTime;

  Order({
    this.id,
    this.restaurantId,
    this.userId,
    this.items,
    this.discount,
    this.waiterTip,
    this.dateTime,
  });
}
