enum PlaceType{
  RESTAURANT,
  CAFE,
  PIZZERIA,
  BAR,
  PUB,
  _fromString
}

extension PlaceTypeExtension on PlaceType {
  static const map = const {
    PlaceType.RESTAURANT: "RESTAURANT",
    PlaceType.CAFE: "CAFE",
    PlaceType.PIZZERIA: "PIZZERIA",
    PlaceType.BAR: "BAR",
    PlaceType.PUB: "PUB",
  };

  String get value => map[this];

  operator[](String key) =>
      PlaceType.values.firstWhere((e) => e.toString() == 'PlaceType.' + key);
}