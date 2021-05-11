import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String id;
  final String restaurantId;
  final String name;
  final String picture;
  final double price;
  final String description;
  final List<String> types;

  MenuItem({
    this.id,
    this.restaurantId,
    this.name,
    this.picture,
    this.price,
    this.description,
    this.types,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
