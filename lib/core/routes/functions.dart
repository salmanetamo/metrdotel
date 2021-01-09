import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:metrdotel/core/routes/router.gr.dart';

void navigateToLoginScreen(BuildContext context) {
    ExtendedNavigator.of(context).push(Routes.loginScreen);
}

void navigateToHomeScreen(BuildContext context) {
    ExtendedNavigator.of(context).push(Routes.homeScreen);
}