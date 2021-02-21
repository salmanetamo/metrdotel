import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrdotel/home/ui/widgets/restaurant_filter.dart';
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
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                profilePictureContainer(),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Hello, Salmane',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Let\'s reserve a table for you',
                      style: Theme.of(context).textTheme.subtitle1,
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
                      height: 32.0,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget get restaurantsFilterCardsList {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: restaurantFilters.map((RestaurantFilter restaurantFilter) {
        return ListTile(
          title: Column(
            children: [
              Image.asset(restaurantFilter.imagePath),
              Text(restaurantFilter.filterString),
              this._selectedFilterIndex == restaurantFilter.index
                  ? Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                    )
                  : Container(),
            ],
          ),
        );
      }).toList(),
    );
  }
}
