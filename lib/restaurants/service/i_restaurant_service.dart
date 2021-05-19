import 'package:dartz/dartz.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';
import 'package:metrdotel/shared/error/failure.dart';

abstract class IRestaurantService {
  Future<Either<Failure, List<Restaurant>>> get();
}
