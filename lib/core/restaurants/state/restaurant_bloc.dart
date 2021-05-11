import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/core/restaurants/model/restaurant.dart';
import 'package:metrdotel/core/restaurants/service/i_restaurant_service.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'restaurant_event.dart';

part 'restaurant_state.dart';

@injectable
class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final IRestaurantService _restaurantService;

  RestaurantBloc(this._restaurantService)
      : super(RestaurantState(
          restaurants: null,
          restaurant: null,
          message: null,
          status: StateStatus.INITIAL,
          failure: null,
        ));

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    if (event is GetAllRestaurantsEvent) {
      yield state.copyWith(
        message: 'Loading',
        status: StateStatus.IN_PROGRESS,
      );
      final restaurantsResponse = await this._restaurantService.get();
      yield restaurantsResponse.fold(
        (failure) => state.copyWith(
          message: failure.message,
          status: StateStatus.FAILURE,
          failure: failure,
        ),
        (response) => state.copyWith(
          restaurants: response,
          status: StateStatus.SUCCESS,
        ),
      );
    }
  }
}
