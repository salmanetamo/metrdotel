import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';
import 'package:metrdotel/restaurants/ui/widgets/restaurant_card.dart';
import 'package:metrdotel/shared/widgets/app_drawer.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LatLng _initialCameraPosition = LatLng(-20.021170, 57.587264);
  late GoogleMapController _mapController;
  Location _location = Location();
  late List<Restaurant> restaurantsList;

  @override
  void initState() {
    this.restaurantsList = restaurants;
    super.initState();
  }

  void _onMapCreated(GoogleMapController _controller) {
    _mapController = _controller;
    _location.onLocationChanged.listen((newLocation) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              newLocation.latitude!,
              newLocation.longitude!,
            ),
            zoom: 0,
          ),
        ),
      );
    });
  }

  Set<Marker> _createRestaurantMarkers() {
    return this.restaurantsList.map((restaurant) => Marker(
      markerId: MarkerId(restaurant.id),
      position: LatLng(restaurant.location.latitude, restaurant.location.latitude),
      infoWindow: InfoWindow(title: restaurant.name),
      // TODO: Add marker icon here
    )).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        scaffoldKey: this._scaffoldKey,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialCameraPosition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              // myLocationEnabled: true,
              markers: _createRestaurantMarkers(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.0,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: textInput(context,
                              hintText: 'Search Cafes',
                              labelText: 'Search Cafes',
                              prefixIcon: Icon(Icons.search_rounded)),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        iconContainer(
                          icon: Icons.filter_list_rounded,
                          iconColor: Colors.white,
                          backgroundColor: Colors.black,
                          isIconButton: true,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Nearby Places',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: ListView(
                      children: restaurants
                          .map(
                            (restaurant) => RestaurantCard(
                              restaurant: restaurant,
                              horizontalDisplay: true,
                              backgroundColor: Colors.white,
                            ),
                          )
                          .toList(),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  // ,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
