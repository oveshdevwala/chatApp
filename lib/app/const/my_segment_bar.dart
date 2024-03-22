// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';

class MySegmentBar extends StatefulWidget {
  MySegmentBar({
    super.key,
    required this.tab1Name,
    required this.tab2Name,
    this.tab3Name,
    this.CurrentTab,
    required this.onChanged,
  });
  String tab1Name;
  String tab2Name;
  String? tab3Name;
  String? CurrentTab;
  final ValueChanged<String> onChanged;
  @override
  State<MySegmentBar> createState() => _MySegmentBarState();
}

class _MySegmentBarState extends State<MySegmentBar> {
  ValueNotifier<String>? segementController;
  @override
  void initState() {
    super.initState();
    getCurrenttab();
  }

  getCurrenttab() async {
    segementController =
        await ValueNotifier(widget.CurrentTab ?? widget.tab1Name);
    setState(() {});
  }

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
              TextStyle(fontWeight: FontWeight.bold, color: UIColors.black),
          activeStyle: TextStyle(
            color: UIColors.white,
            fontWeight: FontWeight.bold,
          ),
          segments: widget.tab3Name == null
              ? {
                  widget.tab1Name.toLowerCase(): widget.tab1Name,
                  widget.tab2Name.toLowerCase(): widget.tab2Name,
                }
              : {
                  widget.tab1Name.toLowerCase(): widget.tab1Name,
                  widget.tab2Name.toLowerCase(): widget.tab2Name,
                  widget.tab3Name!.toLowerCase(): widget.tab3Name!,
                },
          controller: segementController,
        ),
      ),
    ));
  }
}
