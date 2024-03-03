// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/data/datasource/remote/firebase_notification_services/push_notification_services.dart';
import 'package:mangochatapp/features/app/const/my_segment_bar.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/screens/call/call_pickup_screen.dart';
import 'package:mangochatapp/features/screens/home_screen/widgets/stream_state_widgets/error_state_chat_list.dart';
import 'widgets/stream_state_widgets/chated_user_loaded_state.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});
  @override
  Widget build(BuildContext context) {
    FireNotification.initNotifications();
    return CallScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: UIColors.greyShade100,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Search Messages',
                    prefixIcon:
                        Icon(CupertinoIcons.search, color: UIColors.primary),
                    suffixIcon: Icon(Icons.filter_list_rounded,
                        color: UIColors.primary, size: 25)),
              ),
              SizedBox(height: 10),
              MySegmentBar(
                tab1Name: 'Personal',
                tab2Name: 'Group',
                CurrentTab: 'Personal',
                onChanged: (value) {
                  
                  print(value);
                },
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseProvider.getUserIds(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  } else if (snapshot.hasError) {
                    return ErrorStateChatList(error: snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      return ChatedUserLoadedState(snapshot: snapshot);
                    }
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
