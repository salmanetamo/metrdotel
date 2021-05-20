import 'package:flutter/material.dart';
import 'package:metrdotel/shared/widgets/app_drawer.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                profilePictureContainer(),
              ],
            ),
            Center(child: Text('Saved'),)
          ],
        ),
      ),
    );
  }
}
