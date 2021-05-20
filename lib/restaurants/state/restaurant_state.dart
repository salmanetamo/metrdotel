part of 'restaurant_bloc.dart';

@immutable
class RestaurantState {
  final List<Restaurant>? restaurants;
  final Restaurant? restaurant;
  final String? message;
  final StateStatus? status;
  final Failure? failure;

  const RestaurantState({
    required this.restaurants,
    required this.restaurant,
    required this.message,
    required this.status,
    required this.failure,
  });

  RestaurantState copyWith({
    restaurants,
    restaurant,
    message,
    status,
    failure,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      restaurant: restaurant ?? this.restaurant,
      message: message ?? this.message,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
