// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_outline_button.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/text_field_border_decoration.dart';
import 'package:mangochatapp/feature/state_manegment/onboarding_bloc/onboarding_bloc.dart';

import '../widgets/my_onboaring_title.dart';
import '../widgets/my_submit_elevated_button.dart';
import '../widgets/password_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final mFormKey = GlobalKey<FormState>();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController userNameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController mobileNumberContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
          child: Form(
              key: mFormKey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyOnboardingTitle('Create Account'),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'UserName Can\'t be empty';
                          }
                          return null;
                        },
                        controller: userNameContoller,
                        decoration: onBoardingTextFieldDecoration(
                            hint: 'User Name',
                            prefixIcon: Icons.person_2_rounded),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mobile Number Can\' Blank';
                          }
                          return null;
                        },
                        controller: mobileNumberContoller,
                        keyboardType: TextInputType.number,
                        decoration: onBoardingTextFieldDecoration(
                            hint: 'Mobile Number',
                            prefixIcon: Icons.person_2_rounded),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: emailContoller,
                        validator: (value) {
                          const pattern =
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                          final regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'Email Can\'t be empty';
                          } else if (!regExp.hasMatch(value)) {
                            return "Email Must Be gmail.com";
                          }
                          return null;
                        },
                        decoration: onBoardingTextFieldDecoration(
                            hint: 'Email', prefixIcon: Icons.email),
                      ),
                      SizedBox(height: 10),
                      PasswordTextFormField(
                        mContoller: passwordContoller,
                        validator: (value) {
                          if (value!.length <= 7) {
                            return 'Password Must Be At Least 8 Characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      BlocConsumer<OnBoardingBloc, OnBoardingState>(
                        listener: (context, state) {
                          if (state is OnBoardingLoadedState) {
                            Navigator.pushNamed(context, AppRoutes.otpScreen);
                          } else if (state is OnBoardingErrorState) {
                            if (state.errorMsg.contains(
                                'The email address is already in use by another account')) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Email is Already exist'),
                                    SizedBox(
                                      width: 120,
                                      child: MySubmitElevatedButton(
                                          btName: 'Login Here',
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                AppRoutes.signInScreen);
                                          }),
                                    )
                                  ],
                                ),
                              )));
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is OnBoardingLoadingState) {
                            return MySubmitElevatedButton(
                                btName: '',
                                myChild: LinearProgressIndicator(
                                    color: UIColors.yellow),
                                onTap: () {});
                          }

                          return MySubmitElevatedButton(
                              btName: 'Verify Number',
                              onTap: () async {
                                
                                if (mFormKey.currentState!.validate()) {
                                  if (emailContoller.text.isNotEmpty &&
                                      passwordContoller.text.isNotEmpty) {
                                    var newUser = UserModel(
                                      id: FirebaseProvider.userId,
                                      name: userNameContoller.text.toString(),
                                      email: emailContoller.text.toString(),
                                      mobileNumber:
                                          mobileNumberContoller.text.toString(),
                                    );
                                    context.read<OnBoardingBloc>().add(
                                        CreateUserEvent(
                                            password: passwordContoller.text
                                                .toString(),
                                            userModel: newUser));
                                  }
                                }
                              });
                        },
                      ),
                      MyOutlineButton(
                          btName: 'Login Now',
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signInScreen);
                          })
                    ],
                  ),
                ),
              ))),
    );
  }
}
/*    try {
                                UserCredential credential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: emailContoller.text.toString(),
                                        password:
                                            passwordContoller.text.toString());
                                var userid = credential.user!.uid;
                                var firestore =
                                    await FirebaseFirestore.instance;
                                firestore.collection('users').add({
                                  'email': emailContoller.text.toString(),
                                  'name': userNameContoller.text.toString()
                                });
                                var prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(LoginPrefKey, userid);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ChatHomeScreen();
                                  },
                                ));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "The password provided is too weak.")));
                                  print('');
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "The account already exists for that email.")));
                                }
                              } */