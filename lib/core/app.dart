import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/router.gr.dart' as router;
import 'package:metrdotel/core/theme/styles.dart';
import 'package:metrdotel/onboarding/state/onboarding_bloc.dart';
import 'package:metrdotel/restaurants/state/restaurant_bloc.dart';
import 'package:metrdotel/signup/state/signup_cubit.dart';

import 'injection/injection.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = router.Router();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<OnboardingBloc>()),
        BlocProvider(create: (_) => getIt<SignupCubit>()),
        BlocProvider(create: (_) => getIt<RestaurantBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Metrdotel',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),

      )
    );
  }
}