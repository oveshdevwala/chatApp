import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mangochatapp/routes/page_routes.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Lottie.asset('assets/lottie/landing.json', repeat: true, height: 250),
          StartTitle(),
          SizedBox(height: 20),
          StartDiscription(),
          SizedBox(height: 20),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryElevatedButton(
                btName: 'Continue',
                onTap: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.appHomeScreen)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class StartDiscription extends StatelessWidget {
  const StartDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Connect with friends and family securely and private. enjoy!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: UIColors.grey, fontSize: 15),
      ),
    );
  }
}

class StartTitle extends StatelessWidget {
  const StartTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Let\'s start the chat!',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: UIColors.black, fontSize: 23),
      ),
    );
  }
}
