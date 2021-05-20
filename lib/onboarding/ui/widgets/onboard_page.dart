import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/onboarding/model/onboard_page_model.dart';
import 'package:metrdotel/onboarding/state/onboarding_bloc.dart';

import 'drawer_circle_paint.dart';
import 'drawer_paint.dart';

class OnboardPage extends StatefulWidget {
  final PageController pageController;
  final OnboardPageModel pageModel;
  final bool showDrawer;

  const OnboardPage(
      {Key? key, required this.pageModel, required this.pageController, required this.showDrawer})
      : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  _nextButtonPressed() {
    BlocProvider.of<OnboardingBloc>(context)
        .add(ColorChangedEvent(color: widget.pageModel.nextAccentColor));
    widget.pageController.nextPage(
      duration: Duration(
        milliseconds: 4000,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: widget.pageModel.primeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        child: Image.asset(widget.pageModel.imagePath,
                            fit: BoxFit.fitHeight),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.pageModel.caption,
                          style: Theme.of(context).textTheme.headline1
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.pageModel.description,
                          style: Theme.of(context).textTheme.subtitle1, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        !widget.showDrawer ? Container() : Align(
            alignment: Alignment.centerRight,
            child: CustomPaint(
              painter: DrawerPaint(
                  curveColor: widget.pageModel.accentColor, radius: 28.5),
              child: Container(
                width: 50,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48.0, right: 12.0),
                    child: CustomPaint(
                      painter: DrawerCirclePaint(
                        color: widget.pageModel.nextAccentColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: _nextButtonPressed,
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
