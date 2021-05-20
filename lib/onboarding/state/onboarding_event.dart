part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class ColorChangedEvent extends OnboardingEvent {
  final Color color;

  ColorChangedEvent({required this.color});
}
