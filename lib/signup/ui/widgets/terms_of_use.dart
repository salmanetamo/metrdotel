import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';
import 'package:metrdotel/signup/state/signup_cubit.dart';

class TermsOfUse extends StatefulWidget {
  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.acceptedTermsAndConditions != null &&
            state.status != StateStatus.FAILURE) {
          navigateToSignupScreen(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72.0,
                          height: 72.0,
                          child: Image.asset(
                            'images/eating_with_chopsticks.png',
                            // TODO: Replace with correct image
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Terms Of Use',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Webiste Name accessible at Metrdotel.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Minors or people below 18 years old are not allowed to use this Website.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Other than the content you own, under these Terms, Company Name and/or its licensors own all the intellectual property rights and materials contained in this Website.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Certain areas of this Website are restricted from being access by you and Company Name may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: button(
                            context,
                            'Cancel',
                            color: Colors.white,
                            onPressed: () {
                              context
                                  .read<SignupCubit>()
                                  .acceptTermsAndConditions(false);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: button(
                            context,
                            'Accept all',
                            onPressed: () {
                              context
                                  .read<SignupCubit>()
                                  .acceptTermsAndConditions(true);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
