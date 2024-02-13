import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/variables.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/my_submit_elevated_button.dart';
import 'package:mangochatapp/feature/state_manegment/new_chat_bloc/new_chat_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewChatBloc, NewChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewChatLoadedState) {
            UserModel profileData;
            List<UserModel> listOfprofile = [];
            for (int i = 0; i < state.getUsers.docs.length; i++) {
              var userId = FirebaseProvider.userId;
              if (userId == state.getUsers.docs[i].id) {
                listOfprofile
                    .add(UserModel.fromDoc(state.getUsers.docs[i].data()));
                print(userId);
              }
            }
            profileData = listOfprofile[0];
            return Column(
              children: [
                Text(profileData.name),
                Text(profileData.mobileNumber!),
                Text(profileData.accountCreatedDate!),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Consumer<ScreenProvider>(builder: (_, provider, __) {
                      return MySubmitElevatedButton(
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
                          btName: 'Sign Out');
                    }),
                  ),
                ),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
