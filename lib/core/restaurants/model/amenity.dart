enum Amenity{
  WIFI,
  TV,
  PARKING,
  AIR_CONDITIONING,
  _fromString
}

extension AmenityExtension on Amenity {
  static const map = const {
    Amenity.WIFI: "WIFI",
    Amenity.TV: "TV",
    Amenity.PARKING: "PARKING",
    Amenity.AIR_CONDITIONING: "AIR_CONDITIONING",
  };

  String get value => map[this];

  operator[](String key) =>
      Amenity.values.firstWhere((e) => e.toString() == 'Amenity.' + key);
}