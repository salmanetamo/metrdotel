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
    this.id,
    this.restaurantId,
    this.userId,
    this.dateTime,
    this.numberOfPeople,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}
