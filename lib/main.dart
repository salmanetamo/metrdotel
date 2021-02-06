import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'core/app.dart';
import 'core/bloc/custom_bloc_observer.dart';
import 'core/injection/injection.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  configureDependencies(Environment.dev);
  await DotEnv.load(fileName: ".env");
  runApp(App());
}
