import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:metrdotel/core/routes/router.gr.dart';

void navigateToLoginScreen(BuildContext context) {
    AutoRouter.of(context).push(LoginScreenRoute());
}

void navigateToSignupScreen(BuildContext context) {
    AutoRouter.of(context).push(SignupScreenRoute());
}

void navigateToHomeScreen(BuildContext context) {
    AutoRouter.of(context).push(HomeScreenRoute());
}

void navigateToTermsOfUseScreen(BuildContext context) {
    AutoRouter.of(context).push(TermsOfUseRoute());
}

void navigateToPasswordResetScreen(BuildContext context) {
    AutoRouter.of(context).push(PasswordResetScreenRoute());
}