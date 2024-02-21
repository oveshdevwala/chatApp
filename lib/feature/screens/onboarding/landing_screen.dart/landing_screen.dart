import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';
import 'package:mangochatapp/feature/screens/onboarding/landing_screen.dart/widgets/start_discription.dart';

import 'widgets/start_title.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Lottie.asset('assets/lottie/landing.json', repeat: true),
            SizedBox(height: 40),
            StartTitle(),
            SizedBox(height: 20),
            StartDiscription(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryElevatedButton(
                  btName: 'Continue',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.appHomeScreen)),
            ),
            SizedBox(height: 20),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
