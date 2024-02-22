// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';
import 'package:mangochatapp/feature/state_manegment/login_screen/country_code_bloc/contry_code_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/login_screen/otp_verify/onboarding_bloc/onboarding_bloc.dart';

import 'widgets/text_field_and_contry_code.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var numberController = TextEditingController();
  var userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  size: 30,
                  color: UIColors.primary,
                ),
                SizedBox(width: 10),
                Text(
                  'Tolki',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: UIColors.black),
                )
              ]),
              SizedBox(height: 10),
              Text(
                'Hi! welcome to Tolki',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: UIColors.black),
              ),
              Text(
                'Create your Account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: UIColors.grey),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  controller: userNameController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  cursorColor: UIColors.primary,
                  decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.person),
                      hintText: 'User Name',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: UIColors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: UIColors.greyShade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              TextFieldAndContryCode(numberController: numberController),
              Center(
                child: Text(
                  'Securing your personal information is our priority',
                  style: TextStyle(
                      color: UIColors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              BlocBuilder<ContryCodeBloc, ContryCodeState>(
                builder: (context, state) {
                  if (state is ContryCodeLoadingState) {
                    return PrimaryElevatedButton(
                        myWidget: LinearProgressIndicator(
                          color: UIColors.white,
                        ),
                        btName: 'Wait',
                        onTap: () {});
                  }
                  if (state is ContryCodeLoadedState) {
                    return PrimaryElevatedButton(
                        btName: 'Next',
                        onTap: () {
                          var number = numberController.text;
                          var userName = userNameController.text;
                          if (number.isNotEmpty && userName.isNotEmpty) {
                            context.read<OnBoardingBloc>().add(
                                MobileVerifyPhoneNumberEvent(
                                    phoneNumber:
                                        '+${state.code!.phoneCode}${number.trim().toString()}',
                                    context: context));
                            print(number);
                          }
                        });
                  }
                  return PrimaryElevatedButton(
                      btName: 'Next',
                      bgColor: UIColors.grey,
                      onTap: () {
                        // if (numberController.text.isNotEmpty) {
                        //   context.read<OnBoardingBloc>().add(
                        //       MobileVerifyPhoneNumberEvent(
                        //           phoneNumber:
                        //               numberController.text.trim().toString(),
                        //           context: context));
                        // }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
