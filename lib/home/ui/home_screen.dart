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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: destinations.map((HomeScreenDestination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: Colors.grey,
            label: destination.title,
          );
        }).toList(),
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
