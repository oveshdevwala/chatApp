// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/feature/state_manegment/new_contact_bloc/new_contact_bloc.dart';

class NewContactErrorWidget extends StatelessWidget {
  NewContactErrorWidget({super.key, required this.state});
  NewContactErrorState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardLoading(
                  borderRadius: BorderRadius.circular(12),
                  height: 0,
                  child: MyChatTile(
                      phoneNumber: '',
                      userName: state.errorMsg,
                      lastMsg: null,
                      onTap: () {}),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
