import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppDrawer({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      iconContainer(
                        icon: Icons.close,
                        iconColor: Colors.black,
                        backgroundColor: Colors.white,
                        isIconButton: true,
                        onPressed: () {
                          this.scaffoldKey.currentState.openEndDrawer();
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mickasa Ackermann'),
                          Text('12 visits'),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(border: null),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    this._drawerItem(
                        icon: Icons.person, text: 'Profile', onTap: () {}),
                    this._drawerItem(
                        icon: Icons.stars, text: 'Reviews', onTap: () {}),
                    this._drawerItem(
                        icon: Icons.restaurant_menu,
                        text: 'Visits history',
                        onTap: () {}),
                    this._drawerItem(
                        icon: Icons.notifications,
                        text: 'Notifications',
                        onTap: () {}),
                    this._drawerItem(
                        icon: Icons.settings,
                        text: 'App Settings',
                        onTap: () {}),
                    this._drawerItem(
                        icon: Icons.qr_code_sharp,
                        text: 'QR code',
                        onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: button(
                  context,
                  'Logout',
                  color: Colors.white,
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          iconContainer(icon: icon, iconColor: Colors.black),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
