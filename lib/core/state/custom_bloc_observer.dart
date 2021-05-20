import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// Implementing [BlocObserver], [CustomBlocObserver] provides a way of observing
/// the state of the application BLoCs when an event is triggered and when a
/// state is being returned.
class CustomBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.i(event);
    _logger.i(bloc.state);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.i(bloc.state);
    _logger.i(transition.event);
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.i('current state: ${change.currentState}');
    _logger.i('next state: ${change.nextState.toString()}');
    super.onChange(bloc, change);
  }
}