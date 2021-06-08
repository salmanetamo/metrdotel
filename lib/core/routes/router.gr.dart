// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../home/ui/home_screen.dart' as _i6;
import '../../login/ui/login_screen.dart' as _i4;
import '../../onboarding/ui/onboarding.dart' as _i3;
import '../../password_reset/ui/password_reset_screen.dart' as _i8;
import '../../signup/ui/signup_screen.dart' as _i5;
import '../../signup/ui/widgets/terms_of_use.dart' as _i7;

class Router extends _i1.RootStackRouter {
  Router([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Onboarding();
        }),
    LoginScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginScreen();
        }),
    SignupScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignupScreen();
        }),
    HomeScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.HomeScreen();
        }),
    TermsOfUseRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.TermsOfUse();
        }),
    PasswordResetScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.PasswordResetScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OnboardingRoute.name, path: '/Onboarding'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i1.RouteConfig(SignupScreenRoute.name, path: '/signup-screen'),
        _i1.RouteConfig(HomeScreenRoute.name, path: '/'),
        _i1.RouteConfig(TermsOfUseRoute.name, path: '/terms-of-use'),
        _i1.RouteConfig(PasswordResetScreenRoute.name,
            path: '/password-reset-screen')
      ];
}

class OnboardingRoute extends _i1.PageRouteInfo {
  const OnboardingRoute() : super(name, path: '/Onboarding');

  static const String name = 'OnboardingRoute';
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

class SignupScreenRoute extends _i1.PageRouteInfo {
  const SignupScreenRoute() : super(name, path: '/signup-screen');

  static const String name = 'SignupScreenRoute';
}

class HomeScreenRoute extends _i1.PageRouteInfo {
  const HomeScreenRoute() : super(name, path: '/');

  static const String name = 'HomeScreenRoute';
}

class TermsOfUseRoute extends _i1.PageRouteInfo {
  const TermsOfUseRoute() : super(name, path: '/terms-of-use');

  static const String name = 'TermsOfUseRoute';
}

class PasswordResetScreenRoute extends _i1.PageRouteInfo {
  const PasswordResetScreenRoute()
      : super(name, path: '/password-reset-screen');

  static const String name = 'PasswordResetScreenRoute';
}
