part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingState {
  final Color color;

  OnboardingState(this.color);

}

class OnboardingInitial extends OnboardingState {
  OnboardingInitial(Color color) : super(color);
}
