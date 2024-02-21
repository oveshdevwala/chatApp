// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';
import 'package:mangochatapp/feature/state_manegment/login_screen/otp_verify/onboarding_bloc/onboarding_bloc.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPVerifyScreen extends StatefulWidget {
  OTPVerifyScreen(
      {super.key, required this.phoneNumber, required this.verifyId});
  String phoneNumber;
  String verifyId;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  var otpContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Column(
        children: [
          Spacer(),
          Text(
            'Verify Phone',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // SizedBox(height: 10),
          Text(
            'Code has been sent to ${widget.phoneNumber} ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Lottie.asset('assets/lottie/otp_screen.json', height: 200),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: TextFieldPin(
              textController: otpContoller,
              autoFocus: true,
              codeLength: 6,
              selectedDecoration: BoxDecoration(
                color: UIColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: MainAxisAlignment.center,
              defaultBoxSize: 48.0,
              margin: 2,
              selectedBoxSize: 52.0,
              textStyle: TextStyle(
                  fontSize: 20,
                  color: UIColors.white,
                  fontWeight: FontWeight.bold),
              defaultDecoration: BoxDecoration(
                color: UIColors.greyShade200,
                borderRadius: BorderRadius.circular(12),
              ),
              onChange: (code) {
                otpContoller.text = code;
                setState(() {});
              },
            ),
          ),
          Text('Didn\'t get OTP Code?',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: UIColors.black)),
          Text('Resend Code',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: UIColors.primary)),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryElevatedButton(
                btName: 'Verify',
                onTap: () {
                  context.read<OnBoardingBloc>().add(MobileCheckCrediential(
                      otp: otpContoller.text,
                      phoneNumber: widget.phoneNumber,
                      userNameProvider: 'Shaikh',
                      verifyId: widget.verifyId,
                      context: context));
                }),
          )
        ],
      ),
    );
  }
}
