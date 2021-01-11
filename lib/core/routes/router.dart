import 'package:auto_route/auto_route_annotations.dart';
import 'package:metrdotel/home/presentation/screens/home_screen.dart';
import 'package:metrdotel/login/presentation/screens/login_screen.dart';
import 'package:metrdotel/onboarding/presentation/screens/onboarding.dart';
import 'package:metrdotel/signup/presentation/screens/signup_screen.dart';
import 'package:metrdotel/signup/presentation/screens/widgets/terms_of_use.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: Onboarding, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: SignupScreen),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: TermsOfUse),
  ],
)
class $Router {}