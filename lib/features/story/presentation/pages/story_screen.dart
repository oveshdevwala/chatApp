import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/const/my_segment_bar.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              MySegmentBar(
                tab1Name: 'Recent',
                CurrentTab: 'Recent',
                tab2Name: 'Seen',
                onChanged: (value) {
                  print(value);
                },
              ),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                      title: Text('Name'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: UIColors.greyShade100,
                      subtitle: Text('Just Uploaded'),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: UIColors.greyShade200,
                        child: Icon(CupertinoIcons.person),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
