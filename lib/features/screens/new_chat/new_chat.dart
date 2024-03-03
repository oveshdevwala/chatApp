import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/screens/new_chat/widgets/new_contact_appbar.dart';
import 'package:mangochatapp/features/state_manegment/new_contact_bloc/new_contact_bloc.dart';

import 'widgets/new_contact_error_widget.dart';
import 'widgets/new_contact_loaded_widget.dart';
import 'widgets/new_contact_loading_widget.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  void initState() {
    super.initState();

    context.read<NewContactBloc>().add(GetAllContact());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: newContactAppBar(context),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<NewContactBloc, NewContactState>(
            builder: (context, state) {
              if (state is NewContactLoadingState) {
                return NewContactLoadingWidget();
              }
              if (state is NewContactErrorState) {
                return NewContactErrorWidget(state: state);
              }
              if (state is NewContactLoadedState) {
                return NewContactLoadedWidget(myUserModel: state.user!);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
