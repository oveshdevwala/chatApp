import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/profile_manege_screen/my_account_screen/widgets/my_account_appbar.dart';
import 'package:mangochatapp/feature/state_manegment/user_profile_data_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/my_profile_edit_text_field.dart';
import 'widgets/my_profile_picture_update.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  var userNameContoller = TextEditingController();
  var emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        appBar: myAccountAppBar(context),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseProvider.getUserProfileData(FirebaseProvider.userId),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox();
              } else if (snapshot.hasData) {
                UserModel user = UserModel.fromDoc(snapshot.data!.data()!);
                userNameContoller.text = user.name;
                emailContoller.text = user.email!;
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Consumer<CurrentProfilePictureProvider>(
                      builder: (_, provider, child) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Stack(
                          children: [
                            MyProfilePictureUpdate(
                                user: user, provider: provider),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: MyIconButton(
                                  onTap: () {
                                    context
                                        .read<CurrentProfilePictureProvider>()
                                        .chooseFile(context);
                                  },
                                  iconSize: 35,
                                  icon: Icons.change_circle_rounded,
                                  iconColor: UIColors.primary),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        MyProfileEditTextField(
                            labelText: 'User Name',
                            textController: userNameContoller),
                        SizedBox(height: 10),
                        MyProfileEditTextField(
                            labelText: 'Email', textController: emailContoller),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        PrimaryElevatedButton(
                            btName: 'Update',
                            onTap: () {
                              var userName = userNameContoller.text;
                              var email = emailContoller.text;
                              if (userName.isNotEmpty && email.isNotEmpty) {
                                FirebaseProvider.UpdateProfileData(
                                    email: email.trim().toString(),
                                    userName: userName.trim().toString());
                              }
                              Navigator.pop(context);
                              context
                                  .read<CurrentProfilePictureProvider>()
                                  .uploadProfileFile(context);
                            })
                      ],
                    );
                  }),
                );
              }
              return SizedBox();
            }));
  }
}
