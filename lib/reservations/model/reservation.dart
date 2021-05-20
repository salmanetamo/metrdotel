import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

@JsonSerializable()
class Reservation {
  final String id;
  final String restaurantId;
  final String userId;
  final DateTime dateTime;
  final int numberOfPeople;

  Reservation({
    required this.id,
    required this.restaurantId,
    required this.userId,
    required this.dateTime,
    required this.numberOfPeople,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}
