// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../home/ui/home_screen.dart';
import '../../login/ui/login_screen.dart';
import '../../onboarding/ui/onboarding.dart';
import '../../password_reset/ui/password_reset_screen.dart';
import '../../signup/ui/signup_screen.dart';
import '../../signup/ui/widgets/terms_of_use.dart';

class Routes {
  static const String onboarding = '/';
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
  static const String homeScreen = '/home-screen';
  static const String termsOfUse = '/terms-of-use';
  static const String passwordResetScreen = '/password-reset-screen';
  static const all = <String>{
    onboarding,
    loginScreen,
    signupScreen,
    homeScreen,
    termsOfUse,
    passwordResetScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onboarding, page: Onboarding),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.signupScreen, page: SignupScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.termsOfUse, page: TermsOfUse),
    RouteDef(Routes.passwordResetScreen, page: PasswordResetScreen),
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
    SignupScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignupScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    TermsOfUse: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TermsOfUse(),
        settings: data,
      );
    },
    PasswordResetScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PasswordResetScreen(),
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

  Future<dynamic> pushSignupScreen() => push<dynamic>(Routes.signupScreen);

  Future<dynamic> pushHomeScreen() => push<dynamic>(Routes.homeScreen);

  Future<dynamic> pushTermsOfUse() => push<dynamic>(Routes.termsOfUse);

  Future<dynamic> pushPasswordResetScreen() =>
      push<dynamic>(Routes.passwordResetScreen);
}
