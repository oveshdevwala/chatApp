import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';

// ignore: must_be_immutable
class PrimaryElevatedButton extends StatelessWidget {
  PrimaryElevatedButton({
    super.key,
    required this.btName,
    required this.onTap,
    this.bgColor,
    this.myWidget,
  });

  String btName;
  VoidCallback onTap;
  Color? bgColor;
  Widget? myWidget;
  @override
  Widget build(BuildContext context) {
    // var mq= MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              backgroundColor: bgColor ?? UIColors.primary,
              foregroundColor: UIColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: myWidget ??
              Text(
                btName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
    );
  }
}
