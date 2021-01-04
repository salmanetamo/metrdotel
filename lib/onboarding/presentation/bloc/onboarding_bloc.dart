import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial(Color(0xFFFEC92D)));

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is ColorChangedEvent) {
      yield OnboardingInitial(event.color);
    }
  }
}
