// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    id: json['id'] as String,
    restaurantId: json['restaurantId'] as String,
    name: json['name'] as String,
    picture: json['picture'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'picture': instance.picture,
      'price': instance.price,
      'description': instance.description,
      'types': instance.types,
    };
