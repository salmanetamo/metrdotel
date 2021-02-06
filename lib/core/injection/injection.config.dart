// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../auth/service/auth_service.dart';
import '../auth/service/i_auth_service.dart';
import '../storage/i_storage.dart';
import 'injectable_modules.dart';
import '../../login/state/login_cubit.dart';
import '../../onboarding/state/onboarding_bloc.dart';
import '../../password_reset/state/password_reset_cubit.dart';
import '../../signup/state/signup_cubit.dart';
import '../storage/storage.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectableModules = _$InjectableModules();
  gh.lazySingleton<Client>(() => injectableModules.httpClient);
  gh.lazySingleton<FlutterSecureStorage>(() => injectableModules.storage);
  gh.factory<IStorage>(() => Storage(get<FlutterSecureStorage>()));
  gh.lazySingleton<Logger>(() => injectableModules.logger);
  gh.factory<OnboardingBloc>(() => OnboardingBloc());
  gh.factory<PasswordResetCubit>(() => PasswordResetCubit());
  gh.factory<IAuthService>(() => AuthService(
        get<IStorage>(),
        get<Logger>(),
        get<Client>(),
      ));
  gh.factory<LoginCubit>(() => LoginCubit(get<IAuthService>()));
  gh.factory<SignupCubit>(() => SignupCubit(get<IAuthService>()));
  return get;
}

class _$InjectableModules extends InjectableModules {}
