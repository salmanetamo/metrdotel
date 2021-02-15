import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrdotel/home/ui/widgets/home_screen_destination.dart';

import 'home_screen_view.dart';

class HomeScreenPage extends StatefulWidget {
  final HomeScreenDestination destination;

  const HomeScreenPage({Key key, this.destination}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => HomeScreenView(
            destination: widget.destination,
          ),
        );
      },
    );
  }
}
