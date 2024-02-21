// ignore_for_file: must_be_immutable

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/state_manegment/login_screen/country_code_bloc/contry_code_bloc.dart';

class TextFieldAndContryCode extends StatelessWidget {
  TextFieldAndContryCode({super.key, required this.numberController});
  TextEditingController numberController;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: SizedBox(
        width: mq.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ContryCodeBloc, ContryCodeState>(
              builder: (context, state) {
                if (state is ContryCodeLoadingState) {}
                if (state is ContryCodeLoadedState) {
                  return Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          showPhoneCode: true,
                          context: context,
                          onSelect: (value) {
                            context
                                .read<ContryCodeBloc>()
                                .add(ContryCodeGetEvent(contryCode: value));
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: UIColors.greyShade100,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.code!.flagEmoji}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.black),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: UIColors.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (value) {
                          context
                              .read<ContryCodeBloc>()
                              .add(ContryCodeGetEvent(contryCode: value));
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: UIColors.greyShade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${Country.worldWide.flagEmoji}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: UIColors.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 10,
              child: TextField(
                controller: numberController,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                keyboardType: TextInputType.number,
                cursorColor: UIColors.primary,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: UIColors.grey,
                        fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: UIColors.greyShade100,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
