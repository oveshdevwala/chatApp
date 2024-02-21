// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/datasource/remote/firebase_notification_services/push_notification_services.dart';
import 'package:mangochatapp/feature/models/message_model.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:provider/provider.dart';

import '../profile_manege_screen/account_screen/account_screen.dart';

var bottomBarScreens = [HomeScreen(), SizedBox(), SizedBox(), ProfileScreen()];

class AppHome extends StatelessWidget {
  AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseProvider.auth;
    // FirebaseProvider.userId;
    return Scaffold(
        backgroundColor: UIColors.white,
        // appBar: HomePageAppBAr(context),
        bottomNavigationBar: HomeScreenNavigationBar(),
        body: SafeArea(
          child: Consumer<ScreenProvider>(
            builder: (context, provider, child) {
              return bottomBarScreens[provider.screenIndex];
            },
          ),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    FireNotification.initNotifications();
    // context.read<HomeScreenChatsBloc>().add(GetHomeChatsEvent());
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          chatSegment(),
          Divider(color: UIColors.greyShade200, height: 20),
          // FutureBuilder<List<UserModel>>(
          //   future: FirebaseProvider.getAllMesageTest(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       if (snapshot.data!.isNotEmpty) {
          //         return ListView.builder(
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(snapshot.data![index].name),
          //             );
          //           },
          //         );
          //       } else {
          //         print('Data Is Empty');
          //       }
          //     } else if (snapshot.hasError) {
          //       print('Data ${snapshot.error}');
          //     }

          //     return LinearProgressIndicator();
          //   },
          // )

          ///////////////////////////////////////////////////////////////

          // BlocBuilder<HomeScreenChatsBloc, HomeScreenChatsState>(
          //   builder: (context, state) {
          //     if (state is HomeScreenLoadedState) {
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: state.getUsers.length,
          //         physics: NeverScrollableScrollPhysics(),
          //         itemBuilder: (context, index) {
          //        if(state.getUsers.isNotEmpty){
          //             return ListTile(
          //             title: Text(state.getUsers[index].name),
          //           );
          //        }else{
          //            return ListTile(
          //             title: Text('No Data Found'),
          //           );
          //        }
          //         },
          //       );
          //     }
          //     if (state is HomeScreenLoadingState) {
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         itemBuilder: (context, index) {
          //           return ListTile();
          //         },
          //       );
          //     }
          //     if (state is HomeScreenErrorState) {
          //       return Center(child: LinearProgressIndicator());
          //     }
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       itemBuilder: (context, index) {
          //         ListTile();
          //         return null;
          //       },
          //     );
          //   },
          // )
          // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          //   stream: FirebaseProvider.getOnlyChatedUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return ErrorStateChatList(
          //         error: snapshot.error.toString(),
          //       );
          //     }
          //     if (snapshot.hasData) {
          //       print(
          //           'Filtared User Id :${snapshot.data!.docs[0].data()['id']}');
          //       return StreamStateChatList(
          //         snapshot: snapshot,
          //       );
          //     }
          //     return SizedBox();
          //   },
          // )
        ],
      ),
    );
  }
}

class chatSegment extends StatelessWidget {
  const chatSegment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: UIColors.greyShade100,
        surfaceTintColor: UIColors.greyShade100,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: AdvancedSegment(
            itemPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
            backgroundColor: UIColors.greyShade100,
            sliderColor: UIColors.primary,
            sliderOffset: 0.1,
            inactiveStyle:
                TextStyle(fontWeight: FontWeight.bold, color: UIColors.primary),
            activeStyle: TextStyle(
              color: UIColors.white,
              fontWeight: FontWeight.bold,
            ),
            segments: {'personal': 'Personal', 'group': 'Group'},
            controller: ValueNotifier('personal'),
          ),
        ),
      ),
    );
  }
}

class myTabBar extends StatefulWidget {
  const myTabBar({
    super.key,
  });

  @override
  State<myTabBar> createState() => _myTabBarState();
}

class _myTabBarState extends State<myTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabContoller;
  @override
  void initState() {
    super.initState();

    tabContoller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: UIColors.greyShade200,
            borderRadius: BorderRadius.circular(12)),
        child: TabBar(
            splashBorderRadius: BorderRadius.circular(12),
            // labelColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,

            // indicatorColor: Colors.transparent,
            onTap: (value) {
              tabContoller.animateTo(value);
            },
            controller: tabContoller,
            tabs: [
              Tab(
                text: 'Personal',
                height: 60,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: UIColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Personal',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIColors.white,
                          fontSize: 20),
                    )),
              ),
              Tab(
                height: 60,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: UIColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Group',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIColors.white,
                          fontSize: 20),
                    )),
              ),
            ]),
      ),
    );
  }
}
