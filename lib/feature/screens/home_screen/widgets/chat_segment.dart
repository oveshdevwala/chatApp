// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:mangochatapp/constrains/colors.dart';

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

