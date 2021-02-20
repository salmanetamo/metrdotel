import 'package:flutter/material.dart';
import 'package:metrdotel/home/ui/widgets/home_screen_destination.dart';
import 'package:metrdotel/home/ui/widgets/home_screen_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  List<Key> _viewKeys;
  List<AnimationController> _faders;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders = destinations
        .map<AnimationController>((HomeScreenDestination destination) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),
      );
    }).toList();
    _faders[_currentIndex].value = 1.0;

    _viewKeys = List<Key>.generate(
      destinations.length,
      (int index) => GlobalKey(),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: destinations.map((HomeScreenDestination destination) {
            final Widget page = FadeTransition(
              opacity: _faders[destination.index]
                  .drive(CurveTween(curve: Curves.fastOutSlowIn)),
              child: KeyedSubtree(
                key: _viewKeys[destination.index],
                child: HomeScreenPage(
                  destination: destination,
                ),
              ),
            );
            if (destination.index == _currentIndex) {
              _faders[destination.index].forward();
              return page;
            } else {
              _faders[destination.index].reverse();
              if (_faders[destination.index].isAnimating) {
                return IgnorePointer(
                  child: page,
                );
              }
              return Offstage(
                child: page,
              );
            }
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(8.0),
              child: BottomNavigationBar(
                elevation: 0.0,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                currentIndex: _currentIndex,
                showUnselectedLabels: true,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: destinations.map((HomeScreenDestination destination) {
                  return BottomNavigationBarItem(
                    icon: Icon(destination.icon),
                    label: destination.title,
                    backgroundColor: Colors.grey[200],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) {
      controller.dispose();
    }
    super.dispose();
  }
}
