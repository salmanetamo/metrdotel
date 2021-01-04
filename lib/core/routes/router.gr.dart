// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../login/presentation/screens/login_screen.dart';
import '../../onboarding/presentation/screens/onboarding.dart';

class Routes {
  static const String onboarding = '/';
  static const String loginScreen = '/login-screen';
  static const all = <String>{
    onboarding,
    loginScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onboarding, page: Onboarding),
    RouteDef(Routes.loginScreen, page: LoginScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Onboarding: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Onboarding(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushOnboarding() => push<dynamic>(Routes.onboarding);

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);
}
