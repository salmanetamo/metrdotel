import 'package:auto_route/auto_route_annotations.dart';
import 'package:metrdotel/home/ui/home_screen.dart';
import 'package:metrdotel/login/ui/login_screen.dart';
import 'package:metrdotel/onboarding/ui/onboarding.dart';
import 'package:metrdotel/password_reset/ui/password_reset_screen.dart';
import 'package:metrdotel/signup/ui/signup_screen.dart';
import 'package:metrdotel/signup/ui/widgets/terms_of_use.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: Onboarding),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: SignupScreen),
    MaterialRoute(page: HomeScreen, initial: true),
    MaterialRoute(page: TermsOfUse),
    MaterialRoute(page: PasswordResetScreen),
  ],
)
class $Router {}