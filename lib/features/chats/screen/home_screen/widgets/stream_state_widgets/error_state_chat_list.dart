// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';

class ErrorStateChatList extends StatelessWidget {
  ErrorStateChatList({super.key, required this.error});
  String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CardLoading(
            height: 40,
            borderRadius: BorderRadius.circular(12),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CardLoading(
                  borderRadius: BorderRadius.circular(12),
                  height: 0,
                  child: ListTile(
                    title: Text(
                      error.toString(),
                      style: TextStyle(
                          color: UIColors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
