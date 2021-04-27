import 'package:metrdotel/core/orders/model/order.dart';
import 'package:metrdotel/core/reservations/model/reservation.dart';
import 'package:metrdotel/core/reviews/model/review.dart';
import 'package:metrdotel/shared/utils/service/datetime_helper_service.dart';

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

  String getOpeningHoursLabel() {
    var now = DateTime.now();
    var dayOfWeek = DateTimeHelperService.getDayOfWeekFromIndex(now.weekday);

    // Closed if no opening hours for today
    if(!this.openingHours.containsKey(dayOfWeek)) {
      return "Closed";
    }
    var openingHoursForToday = this.openingHours[dayOfWeek];

    // Checking if current time still before closing times
    var afterAllEndTimes = true;
    for (var openingHourEntry in openingHoursForToday) {
      if (int.parse(openingHourEntry["end"]) < now.hour) {
        afterAllEndTimes = false;
      }
    }
    if (afterAllEndTimes) {
      return "Closed for today";
    }

    // Check if current time within start and end times
    var entryWithValidEnd = openingHoursForToday
        .where((entry) => int.parse(entry["end"]) > now.hour)
        .first;
    var startHour = int.parse(entryWithValidEnd["start"]);
    if (startHour <= now.hour) {
      return "Open";
    } else {
      var difference = now.hour - startHour;
      if(difference <= 6) {
        return "Opens in $difference hours";
      }
      return "Closed";
    }
  }
}
