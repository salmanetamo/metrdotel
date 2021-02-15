import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:metrdotel/home/ui/widgets/reserved.dart';
import 'package:metrdotel/home/ui/widgets/saved.dart';

import 'home.dart';
import 'nearby.dart';

class HomeScreenDestination {
  final IconData icon;
  final String title;
  final int index;
  final Widget widget;

  HomeScreenDestination({
    @required this.title,
    @required this.icon,
    @required this.index,
    @required this.widget,
  });
}

List<HomeScreenDestination> destinations = <HomeScreenDestination>[
  HomeScreenDestination(
    widget: Home(),
    title: 'Home',
    icon: Icons.restaurant,
    index: 0,
  ),
  HomeScreenDestination(
    widget: Nearby(),
    title: 'Nearby',
    icon: Icons.pin_drop,
    index: 1,
  ),
  HomeScreenDestination(
    widget: Reserved(),
    title: 'Reserved',
    icon: Icons.calendar_today_rounded,
    index: 2,
  ),
  HomeScreenDestination(
    widget: Saved(),
    title: 'Saved',
    icon: Icons.bookmark,
    index: 3,
  ),
];
