import 'package:flutter/material.dart';
import 'package:metrdotel/shared/widgets/app_drawer.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(scaffoldKey: this._scaffoldKey,),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.menu_outlined, size: 32.0,), onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },),
                  profilePictureContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
