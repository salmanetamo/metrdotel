import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:metrdotel/core/auth/service/i_auth_service.dart';
import 'package:metrdotel/core/http/http_utils.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/error/api_error/api_error.dart';

import 'i_restaurant_service.dart';

@Injectable(as: IRestaurantService)
class RestaurantService implements IRestaurantService {
  final IAuthService _authService;
  final Logger _logger;
  final http.Client _httpClient;

  RestaurantService(this._logger, this._httpClient, this._authService);

  @override
  Future<Either<Failure, List<Restaurant>>> get() async {
    final url = "/restaurants";

    this._logger.i("Fetching restaurants...");

    final token = await this._authService.getToken();
    var response = await this._httpClient.get(
      getHttpUri(endpoint: url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      this._logger.i("Success!");
      return right(
          (jsonDecode(response.body) as List)
              .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
              .toList()
      );
    } else {
      this._logger.e("Something went wrong while fetching restaurants");
      Map responseMap = jsonDecode(response.body);
      return left(Failure(
        message: null,
        error: ApiError.fromJson(responseMap['apierror']),
      ));
    }
  }

}