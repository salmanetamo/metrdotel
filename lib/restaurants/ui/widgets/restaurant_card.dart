import 'package:flutter/material.dart';
import 'package:metrdotel/restaurants/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Color backgroundColor;
  final bool horizontalDisplay;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
    this.backgroundColor = Colors.grey,
    this.horizontalDisplay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: horizontalDisplay ? EdgeInsets.only(right: 16.0) : EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor == Colors.grey ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            width: horizontalDisplay ? MediaQuery.of(context).size.width - 64.0 : double.infinity,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              image: DecorationImage(
                image: AssetImage(
                  'images/restaurant.jpg',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8.0, left: 8.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200]!.withOpacity(0.75),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(restaurant.openingHoursLabel)
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    true ? Icons.bookmark : Icons.bookmark_border,
                    // TODO: Check whether saved
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {}, // TODO: Save restaurant
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  children: [
                    Text(
                      '(${restaurant.reviews.length})',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      '${restaurant.averageRating}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.star_border_rounded)
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      '${restaurant.location.name}',
                      // TODO: Figure out location based on coordinates
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.attach_money_rounded),
                  Icon(Icons.attach_money_rounded),
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
