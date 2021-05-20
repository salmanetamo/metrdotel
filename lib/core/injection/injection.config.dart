// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

import '../../login/state/login_cubit.dart' as _i15;
import '../../onboarding/state/onboarding_bloc.dart' as _i8;
import '../../password_reset/service/i_password_reset_service.dart' as _i11;
import '../../password_reset/service/password_reset_service.dart' as _i12;
import '../../password_reset/state/password_reset_cubit.dart' as _i16;
import '../../restaurants/service/i_restaurant_service.dart' as _i13;
import '../../restaurants/service/restaurant_service.dart' as _i14;
import '../../restaurants/state/restaurant_bloc.dart' as _i17;
import '../../signup/state/signup_cubit.dart' as _i18;
import '../auth/service/auth_service.dart' as _i10;
import '../auth/service/i_auth_service.dart' as _i9;
import '../storage/i_storage.dart' as _i5;
import '../storage/storage.dart' as _i6;
import 'injectable_modules.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModules = _$InjectableModules();
  gh.lazySingleton<_i3.Client>(() => injectableModules.httpClient);
  gh.lazySingleton<_i4.FlutterSecureStorage>(() => injectableModules.storage);
  gh.factory<_i5.IStorage>(() => _i6.Storage(get<_i4.FlutterSecureStorage>()));
  gh.lazySingleton<_i7.Logger>(() => injectableModules.logger);
  gh.factory<_i8.OnboardingBloc>(() => _i8.OnboardingBloc());
  gh.factory<_i9.IAuthService>(() => _i10.AuthService(
      get<_i5.IStorage>(), get<_i7.Logger>(), get<_i3.Client>()));
  gh.factory<_i11.IPasswordResetService>(
      () => _i12.PasswordResetService(get<_i7.Logger>(), get<_i3.Client>()));
  gh.factory<_i13.IRestaurantService>(() => _i14.RestaurantService(
      get<_i7.Logger>(), get<_i3.Client>(), get<_i9.IAuthService>()));
  gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(get<_i9.IAuthService>()));
  gh.factory<_i16.PasswordResetCubit>(
      () => _i16.PasswordResetCubit(get<_i11.IPasswordResetService>()));
  gh.factory<_i17.RestaurantBloc>(
      () => _i17.RestaurantBloc(get<_i13.IRestaurantService>()));
  gh.factory<_i18.SignupCubit>(() => _i18.SignupCubit(get<_i9.IAuthService>()));
  return get;
}

class _$InjectableModules extends _i19.InjectableModules {}
