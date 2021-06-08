import 'package:flutter/material.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';
import 'package:metrdotel/restaurants/ui/widgets/restaurant_card.dart';
import 'package:metrdotel/shared/widgets/app_drawer.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Restaurant> restaurantsList;

  @override
  void initState() {
    this.restaurantsList = restaurants;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        scaffoldKey: this._scaffoldKey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 32.0,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                profilePictureContainer(),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Saved Places(${this.restaurantsList.length})',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: getRestaurantsSection(context),
            )
          ],
        ),
      ),
    );
  }


  Widget getRestaurantsSection(BuildContext context) {
    // TODO: Update this
    return ListView(
      children: restaurants
          .map((restaurant) => RestaurantCard(restaurant: restaurant))
          .toList(),
    );
    // switch (state.status) {
    //   case StateStatus.IN_PROGRESS:
    //     return showLoadingSpinner(context);
    //   case StateStatus.SUCCESS:
    //     return ListView(
    //       children: state.restaurants!
    //           .map((restaurant) => RestaurantCard(restaurant: restaurant))
    //           .toList(),
    //     );
    //   case StateStatus.FAILURE:
    //     return Container(
    //       child: Text(state.failure!.message!),
    //     );
    //   default:
    //     return Container();
    // }
  }

}
