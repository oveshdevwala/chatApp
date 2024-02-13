import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_outline_button.dart';
import 'package:mangochatapp/feature/state_manegment/phonenumber_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/email_text_field.dart';
import 'widgets/phone_number_textfield.dart';
import 'widgets/send_otp_button.dart';
import 'widgets/user_name_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.yellowShade100,
      body: SafeArea(
        child: Center(
          child: Consumer<PhoneNumberProvider>(
              builder: (context, provider, child) {
            return Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhoneNumberTextfield(
                        numberContoller: provider.numberController),
                    SizedBox(height: 10),
                    userNameField(
                        userNameContoller: provider.userNameController),
                    SizedBox(height: 10),
                    EmailTextField(emailContoller: provider.emailController),
                    SizedBox(height: 10),
                    SendOTPButton(numberController: provider.numberController),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: MyOutlineButton(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.signInScreen),
                          btName: "Login with Email"),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
