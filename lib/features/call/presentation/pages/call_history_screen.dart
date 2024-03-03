import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/const/my_segment_bar.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MySegmentBar(
                  tab1Name: 'All',
                  CurrentTab: 'All',
                  tab2Name: 'Video',
                  tab3Name: 'Voice',
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: UIColors.greyShade200,
                          leading: CircleAvatar(
                            backgroundColor: UIColors.greyShade300,
                            radius: 22,
                            child: Icon(
                              Icons.person_2_outlined,
                              color: UIColors.black,
                            ),
                          ),
                          title: Text(
                            'Ovesh Shaikh',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                wordSpacing: 1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                color: UIColors.black),
                          ),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.phone_fill_arrow_down_left,
                                color: UIColors.red,
                                size: 16,
                              ),
                              SizedBox(width: 7),
                              FittedBox(
                                  child: Text(
                                '7 November 2023',
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    wordSpacing: 1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: UIColors.grey),
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('02:13'),
                              // SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.phone_fill,
                                  color: UIColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
