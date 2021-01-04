import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/core/routes/router.gr.dart';
import 'package:metrdotel/onboarding/data/onboard_data.dart';
import 'package:metrdotel/onboarding/presentation/bloc/onboarding_bloc.dart';

import 'widgets/onboard_page.dart';
import 'widgets/page_view_indicator.dart';

class Onboarding extends StatefulWidget {
  final PageController pageController = PageController();

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool _showSkipButton = true;
  bool _showStartUsingButton = false;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      if (widget.pageController.page != null &&
          widget.pageController.page.floor() >= onboardData.length - 1) {
        setState(() {
          _showSkipButton = false;
          _showStartUsingButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
                  body: Stack(
            children: <Widget>[
              PageView.builder(
                controller: widget.pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: onboardData.length,
                itemBuilder: (context, index) {
                  return OnboardPage(
                    pageController: widget.pageController,
                    pageModel: onboardData[index],
                    showDrawer: !_showStartUsingButton,
                  );
                },
              ),
              !_showSkipButton
                  ? Container()
                  : Container(
                      width: double.infinity,
                      height: 96,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 48.0),
                            child: FlatButton(
                              height: 16,
                              child: Text(
                                'SKIP',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 16),
                              ),
                              onPressed: () => navigateToLoginScreen(context),
                            ),
                          ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 56.0, left: 40),
                  child: PageViewIndicator(
                    controller: widget.pageController,
                    itemCount: onboardData.length,
                    color: state.color,
                  ),
                ),
              ),
              !_showStartUsingButton
                  ? Container()
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 56.0, right: 32.0),
                        child: FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Start using',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                Icon(Icons.arrow_right_alt,
                                    color: Theme.of(context).primaryColor,
                                    size: 24),
                              ],
                            ),
                            onPressed: () => navigateToLoginScreen(context),
                            ),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
