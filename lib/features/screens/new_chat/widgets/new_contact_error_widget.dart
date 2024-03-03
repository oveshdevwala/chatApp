// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/features/state_manegment/new_contact_bloc/new_contact_bloc.dart';

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
                return Text(state.errorMsg);
              },
            )
          ],
        ),
      ),
    );
  }
}
