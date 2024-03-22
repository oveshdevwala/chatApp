import 'package:flutter/material.dart';
import 'package:mangochatapp/app/global/entities/variables.dart';
import 'package:mangochatapp/features/onboarding/screen/splash_screen.dart';
import 'package:mangochatapp/features/account/screen/account_screen/widgets/my_profile_list_tile.dart';
import 'package:mangochatapp/features/home/provider/screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogoutButtonTile extends StatelessWidget {
  const MyLogoutButtonTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (_, provider, __) {
      return MyProfileListTile(
          onTap: () async {
            provider.screenIndex = 0;
            var prefs = await SharedPreferences.getInstance();
            prefs.setString(LoginPrefKey, '');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ));
          },
          leadingIcon: Icons.logout_rounded,
          title: "LogOut",
          subTitle: 'Sign Out ',
          trailingIcon: Icons.chevron_right_rounded);
    });
  }
}
