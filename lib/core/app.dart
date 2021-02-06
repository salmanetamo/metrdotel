import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/router.gr.dart' as router;
import 'package:metrdotel/core/theme/styles.dart';
import 'package:metrdotel/onboarding/state/onboarding_bloc.dart';
import 'package:metrdotel/signup/state/signup_cubit.dart';

import 'injection/injection.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<OnboardingBloc>()),
        BlocProvider(create: (_) => getIt<SignupCubit>()),
      ],
      child: MaterialApp(
        title: 'Metrdotel',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        builder: ExtendedNavigator.builder(
          router: router.Router(),
        ),
      )
    );
  }
}