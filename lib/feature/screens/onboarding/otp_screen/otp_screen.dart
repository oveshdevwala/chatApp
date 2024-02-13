// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_onboaring_title.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_submit_elevated_button.dart';
import 'package:mangochatapp/feature/state_manegment/onboarding_bloc/onboarding_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/phonenumber_provider.dart';
import 'package:provider/provider.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPScreeen extends StatefulWidget {
  OTPScreeen({super.key, required this.verifyId});
  String verifyId;
  @override
  State<OTPScreeen> createState() => _OTPScreeenState();
}

class _OTPScreeenState extends State<OTPScreeen> {
  var otpContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Card(
        color: UIColors.yellowShade100,
        child: Flexible(
          flex: 10,
          child: Consumer<PhoneNumberProvider>(
              builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyOnboardingTitle('Enter OTP'),
                SizedBox(height: 20),
                TextFieldPin(
                  textController: otpContoller,
                  autoFocus: true,
                  codeLength: 6,
                  selectedDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: UIColors.black)),
                  alignment: MainAxisAlignment.center,
                  defaultBoxSize: 50.0,
                  margin: 2,
                  selectedBoxSize: 46.0,
                  textStyle: TextStyle(fontSize: 16),
                  defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: UIColors.black)),
                  onChange: (code) {
                    otpContoller.text = code;

                    setState(() {});
                  },
                ),
                BlocConsumer<OnBoardingBloc, OnBoardingState>(
                  listener: (context, state) {
                    // if (state is OnBoardingLoadedState) {
                    //   Navigator.pushNamed(context, AppRoutes.appHomeScreen);
                    // }

                    // if (state is OnBoardingErrorState) {
                    //   ScaffoldMessenger.of(context)
                    //       .showSnackBar(SnackBar(content: Text(state.errorMsg)));
                    // }
                  },
                  builder: (context, state) {
                    if (state is OnBoardingLoadingState) {
                      return SizedBox(
                          width: mq.width * .8,
                          child: MySubmitElevatedButton(
                              btName: '',
                              myChild: LinearProgressIndicator(
                                color: UIColors.black,
                              ),
                              onTap: () {}));
                    }
                    return SizedBox(
                        width: mq.width * .8,
                        child: MySubmitElevatedButton(
                            btName: 'Submit OTP',
                            onTap: () {
                              var number = provider.numberController.text;
                              var userName = provider.userNameController.text;
                              var email = provider.emailController.text;
                              context.read<OnBoardingBloc>().add(
                                  MobileCheckCrediential(
                                    emailNumber: email,
                                    
                                      phoneNumber: number.trim().toString(),
                                      userNameProvider:
                                          userName.trim().toString(),
                                      otp: otpContoller.text.trim().toString(),
                                      verifyId: widget.verifyId,
                                      context: context));
                            }));
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
