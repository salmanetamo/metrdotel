import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/home/ui/widgets/restaurant_filter.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';
import 'package:metrdotel/restaurants/state/restaurant_bloc.dart';
import 'package:metrdotel/restaurants/ui/widgets/restaurant_card.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/app_drawer.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state.status == StateStatus.INITIAL) {
          BlocProvider.of<RestaurantBloc>(context)
              .add(GetAllRestaurantsEvent());
        }
        return Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawer(
            scaffoldKey: this._scaffoldKey,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Hello, Salmane',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline1,
                    ),
                    Text(
                      'Let\'s reserve a table for you',
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
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
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 6,
                  child: restaurantsFilterCardsList,
                ),
                SizedBox(
                  height: 32.0,
                ),
                Expanded(
                  child: getRestaurantsSection(context, state),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getRestaurantsSection(BuildContext context, RestaurantState state) {
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

    Widget buildRestaurantList() {
      return BlocConsumer<RestaurantBloc, RestaurantState>(
        listener: (context, state) {
          print('listener');
          if (state.status == StateStatus.INITIAL) {
            BlocProvider.of<RestaurantBloc>(context)
                .add(GetAllRestaurantsEvent());
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case StateStatus.IN_PROGRESS:
              return showLoadingSpinner(context);
            case StateStatus.SUCCESS:
              return ListView(
                children: state.restaurants!
                    .map((restaurant) => RestaurantCard(restaurant: restaurant))
                    .toList(),
              );
            case StateStatus.FAILURE:
              return Container(
                child: Text(state.failure!.message!),
              );
            default:
              return Container();
          }
        },
      );
    }

    Widget get restaurantsFilterCardsList {
      return Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: restaurantFilters.map((RestaurantFilter restaurantFilter) {
            return InkWell(
              onTap: () {
                setState(() {
                  this._selectedFilterIndex = restaurantFilter.index;
                });
              },
              child: Padding(
                padding: restaurantFilter.index == 0
                    ? EdgeInsets.only(right: 4.0)
                    : restaurantFilter.index == restaurantFilters.length - 1
                    ? EdgeInsets.only(left: 4.0)
                    : EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    border: this._selectedFilterIndex == restaurantFilter.index
                        ? Border.all(color: Colors.grey[400]!)
                        : null,
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 5,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        restaurantFilter.imagePath,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 16,
                      ),
                      Column(
                        children: [
                          Text(
                            restaurantFilter.filterString,
                            style: Theme
                                .of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                fontSize: 10.0,
                                fontWeight: this._selectedFilterIndex ==
                                    restaurantFilter.index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          this._selectedFilterIndex == restaurantFilter.index
                              ? Container(
                            margin: EdgeInsets.only(top: 2.0),
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                shape: BoxShape.circle),
                          )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  }
