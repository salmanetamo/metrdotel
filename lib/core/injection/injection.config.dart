// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../login/presentation/cubit/login_cubit.dart';
import '../../onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../signup/presentation/cubit/signup_cubit.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<LoginCubit>(() => LoginCubit());
  gh.factory<OnboardingBloc>(() => OnboardingBloc());
  gh.factory<SignupCubit>(() => SignupCubit());
  return get;
}
