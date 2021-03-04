import 'package:metrdotel/core/orders/model/Order.dart';
import 'package:metrdotel/core/reservations/model/reservation.dart';
import 'package:metrdotel/core/reviews/model/review.dart';

import 'amenity.dart';
import 'menu_item.dart';
import 'place_type.dart';
import 'location.dart';

class Restaurant {
  final String id;
  final List<Amenity> amenities;
  final PlaceType type;
  final String coverImage;
  final Map<String, List<Map<String, String>>> openingHours;
  final int priceRange;
  final String name;
  final String description;
  final List<Review> reviews;
  final List<MenuItem> menu;
  final List<Order> orders;
  final List<Reservation> reservations;
  final Location location;

  Restaurant({
    this.id,
    this.amenities,
    this.type,
    this.coverImage,
    this.openingHours,
    this.priceRange,
    this.name,
    this.description,
    this.reviews,
    this.menu,
    this.orders,
    this.reservations,
    this.location,
  });
}
