import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';

class MyStatusRow extends StatelessWidget {
  const MyStatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            status_bar_ui(name: 'Add Story', statusimage: null),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: status_data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return status_bar_ui(
                  statusimage: status_data[index]['profile'],
                  name: status_data[index]['name'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget status_bar_ui({required String name, required String? statusimage}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage:
                statusimage != null ? AssetImage(statusimage) : null,
            child: statusimage != null ? null : Icon(Icons.add),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
