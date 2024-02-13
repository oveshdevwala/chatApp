// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_submit_elevated_button.dart';
import 'package:mangochatapp/feature/state_manegment/onboarding_bloc/onboarding_bloc.dart';

class SendOTPButton extends StatelessWidget {
  SendOTPButton({super.key, required this.numberController});
  TextEditingController numberController;
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
      listener: (_, state) async {
        // if (state is OnBoardingLoadedState) {
        //   await Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //             OTPScreeen(verifyId: state.verifyId!),
        //       ));
        // }
        if (state is OnBoardingErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (_, state) {
        
        if (state is OnBoardingLoadingState) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: MySubmitElevatedButton(
                  btName: '',
                  myChild: LinearProgressIndicator(
                    color: UIColors.black,
                  ),
                  onTap: () {}));
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 55,
          child: MySubmitElevatedButton(
                btName: 'Send OTP',
                onTap: () async {
                  if ( numberController.text.isNotEmpty) {
                    context.read<OnBoardingBloc>().add(
                        MobileVerifyPhoneNumberEvent(
                            phoneNumber: numberController.text.trim().toString(),
                            context: context));
                  }
                })
        );
      },
    );
  }
}
