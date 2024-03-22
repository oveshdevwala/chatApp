import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/chats/bloc/new_contact_bloc/new_contact_bloc.dart';
import 'package:mangochatapp/features/chats/screen/new_chat/widgets/new_contact_appbar.dart';

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
      body: SafeArea(
        child: BlocBuilder<NewContactBloc, NewContactState>(
          builder: (context, state) {
            if (state is NewContactLoadingState) {
              return NewContactLoadingWidget();
            }
            if (state is NewContactErrorState) {
              return NewContactErrorWidget(state: state);
            }
            if (state is NewContactLoadedState) {
              // if(state.Contacts != null){
              print('This is Loaded Contact State');
              return NewContactLoadedWidget(myUserModel: state.user);
              // }
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
