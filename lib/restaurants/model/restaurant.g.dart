// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    id: json['id'] as String,
    amenities: (json['amenities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AmenityEnumMap, e))
        ?.toList(),
    type: _$enumDecodeNullable(_$PlaceTypeEnumMap, json['type']),
    coverImage: json['coverImage'] as String,
    openingHours: (json['openingHours'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => (e as Map<String, dynamic>)?.map(
                    (k, e) => MapEntry(k, e as String),
                  ))
              ?.toList()),
    ),
    priceRange: json['priceRange'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    reviews: (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : Review.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    menu: (json['menu'] as List)
        ?.map((e) =>
            e == null ? null : MenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orders: (json['orders'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    reservations: (json['reservations'] as List)
        ?.map((e) =>
            e == null ? null : Reservation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amenities':
          instance.amenities?.map((e) => _$AmenityEnumMap[e])?.toList(),
      'type': _$PlaceTypeEnumMap[instance.type],
      'coverImage': instance.coverImage,
      'openingHours': instance.openingHours,
      'priceRange': instance.priceRange,
      'name': instance.name,
      'description': instance.description,
      'reviews': instance.reviews?.map((e) => e?.toJson())?.toList(),
      'menu': instance.menu?.map((e) => e?.toJson())?.toList(),
      'orders': instance.orders?.map((e) => e?.toJson())?.toList(),
      'reservations': instance.reservations?.map((e) => e?.toJson())?.toList(),
      'location': instance.location?.toJson(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AmenityEnumMap = {
  Amenity.WIFI: 'WIFI',
  Amenity.TV: 'TV',
  Amenity.PARKING: 'PARKING',
  Amenity.AIR_CONDITIONING: 'AIR_CONDITIONING',
};

const _$PlaceTypeEnumMap = {
  PlaceType.RESTAURANT: 'RESTAURANT',
  PlaceType.CAFE: 'CAFE',
  PlaceType.PIZZERIA: 'PIZZERIA',
  PlaceType.BAR: 'BAR',
  PlaceType.PUB: 'PUB',
};
