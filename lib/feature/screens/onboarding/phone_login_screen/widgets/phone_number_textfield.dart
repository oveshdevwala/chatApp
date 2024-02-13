// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class PhoneNumberTextfield extends StatelessWidget {
  PhoneNumberTextfield({
    super.key,
    required this.numberContoller,
  });

  TextEditingController numberContoller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          border: Border.all(color: UIColors.yellow, width: 2),
          color: UIColors.yellowShade100,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' 91',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UIColors.black,
                fontSize: 15),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: numberContoller,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: UIColors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  prefixStyle: TextStyle(color: UIColors.black),
                  fillColor: UIColors.yellowShade100,
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UIColors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none)),
            ),
          ),
        ],
      ),
    );
  }
}
