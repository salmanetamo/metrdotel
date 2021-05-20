import 'package:flutter/material.dart';

import 'home_screen_destination.dart';

class HomeScreenView extends StatefulWidget {
  final HomeScreenDestination destination;

  const HomeScreenView({Key? key, required this.destination}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  @override
  Widget build(BuildContext context) {
    return widget.destination.widget;
  }
}
