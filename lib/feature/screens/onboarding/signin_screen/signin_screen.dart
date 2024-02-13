// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_onboaring_title.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/text_field_border_decoration.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_submit_elevated_button.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/password_text_form_field.dart';

import 'package:mangochatapp/feature/state_manegment/onboarding_bloc/onboarding_bloc.dart';

import '../widgets/my_outline_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  var emailContoller = TextEditingController();
  var passContoller = TextEditingController();
  final mFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.yellowShade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: mFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyOnboardingTitle('Login Here'),
                SizedBox(height: 10),
                TextFormField(
                    controller: emailContoller,
                    validator: (value) {
                      return null;
                    },
                    decoration: onBoardingTextFieldDecoration(
                      hint: 'Email',
                      prefixIcon: Icons.email,
                    )),
                SizedBox(height: 10),
                PasswordTextFormField(
                  mContoller: passContoller,
                  validator: (value) {
                    if (value!.length <= 7) {
                      return 'Password Must Be 8 Characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                BlocConsumer<OnBoardingBloc, OnBoardingState>(
                  listener: (context, state) {
                    if (state is OnBoardingLoadedState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Successfully')));
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.appHomeScreen);
                      // Navigator.pushReplacement(
                      //     context, MaterialPageRoute(builder: (context) => AppHome(),));
                    } else if (state is OnBoardingErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMsg)));
                    }
                  },
                  builder: (context, state) {
                    if (state is OnBoardingLoadingState) {
                      return MySubmitElevatedButton(
                          btName: 'Sign In',
                          myChild: LinearProgressIndicator(
                            color: UIColors.black,
                          ),
                          onTap: () {});
                    }
                    return MySubmitElevatedButton(
                        btName: 'Sign In',
                        onTap: () async {
                          if (emailContoller.text.isNotEmpty &&
                              passContoller.text.isNotEmpty) {
                            context.read<OnBoardingBloc>().add(SignInEvent(
                                email: emailContoller.text.toString(),
                                password: passContoller.text.toString()));
                          }
                        });
                  },
                ),
                MyOutlineButton(
                    btName: 'Create Account',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUpScreen);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
  try {
                        if (emailContoller.text.isNotEmpty &&
                            passContoller.text.isNotEmpty) {
                          var credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailContoller.text.toString(),
                            password: passContoller.text.toString(),
                          )
                              .then((value) {


                          });
                          String uid = credential.user!.uid;
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setString(LoginPrefKey, uid);
                        }
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      } */