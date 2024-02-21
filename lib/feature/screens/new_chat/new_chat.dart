import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/new_chat/widgets/new_contact_appbar.dart';
import 'package:mangochatapp/feature/state_manegment/new_contact_bloc/new_contact_bloc.dart';

import 'widgets/new_contact_error_widget.dart';
import 'widgets/new_contact_loaded_widget.dart';
import 'widgets/new_contact_loading_widget.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewContactBloc>().add(GetAllContact());
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: newContactAppBar(context),
      body: SafeArea(child: BlocBuilder<NewContactBloc, NewContactState>(
        builder: (context, state) {
          if (state is NewContactLoadingWidget) {
            return NewContactLoadingWidget();
          } else if (state is NewContactErrorState) {
            return NewContactErrorWidget(state: state);
          } else if (state is NewContactLoadedState) {
            
            return NewContactLoadedWidget(myUserModel: state.user!);
          }
          return NewContactLoadingWidget();
        },
      )),
    );
  }
}
