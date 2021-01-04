import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/app.dart';
import 'core/bloc/custom_bloc_observer.dart';
import 'core/injection/injection.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  configureDependencies(Environment.dev);
  runApp(App());
}
