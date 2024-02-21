import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/variables.dart';
import 'package:mangochatapp/feature/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:mangochatapp/feature/screens/profile_manege_screen/account_screen/widgets/my_profile_list_tile.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
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
