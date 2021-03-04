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
}
