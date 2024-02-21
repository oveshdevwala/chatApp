import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

// ignore: must_be_immutable
class PrimaryElevatedButton extends StatelessWidget {
  PrimaryElevatedButton({
    super.key,
    required this.btName,
    required this.onTap,
    this.bgColor,
  });

  String btName;
  VoidCallback onTap;
  Color? bgColor;
  @override
  Widget build(BuildContext context) {
    // var mq= MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              backgroundColor:bgColor?? UIColors.primary,
              foregroundColor: UIColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            btName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
    );
  }
}
