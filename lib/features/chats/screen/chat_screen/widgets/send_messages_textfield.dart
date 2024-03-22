// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/bloc/imagePickerBloc/image_picker_bloc.dart';
import 'package:mangochatapp/features/chats/bloc/video_picker_bloc/video_picker_bloc.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:provider/provider.dart';

class SendMessageBar extends StatelessWidget {
  SendMessageBar({super.key, required this.userModel});
  UserModel userModel;
  var messageContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: UIColors.primary,
        height: 71,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            showMoreOptionBottomSheet(context,
                                finalcontext: context, userModel: userModel);
                          },
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          icon: Icon(
                            CupertinoIcons.add_circled,
                            size: 40,
                            color: UIColors.white,
                          ),
                        )),
                    SizedBox(width: 5),
                    Expanded(
                      flex: 6,
                      child: TextField(
                          controller: messageContoller,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  var msg = messageContoller.text;
                                  if (msg.isNotEmpty) {
                                    FirebaseProvider.sendTextMessage(
                                        message:
                                            messageContoller.text.toString(),
                                        userModel: userModel);
                                  }
                                },
                                icon: Icon(Icons.send_rounded,
                                    color: UIColors.primary, size: 30),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              fillColor: UIColors.greyShade100,
                              filled: true,
                              hintText: 'Type Message',
                              hintStyle: TextStyle(color: UIColors.primary))),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

showMoreOptionBottomSheet(BuildContext context,
    {required BuildContext finalcontext, UserModel? userModel}) {
  return showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(maxHeight: 200),
    backgroundColor: UIColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    builder: (context) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              IndictorLine(),
              SizedBox(height: 15),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  CustomSelectContainer(
                      icon: Icons.image,
                      title: 'Image',
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<ImagePickerBloc>()
                            .add(PickImageEvent(userModel: userModel!));
                      }),
                  CustomSelectContainer(
                      icon: Icons.video_file,
                      title: 'Video',
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<VideoPickerBloc>()
                            .add(PickVideoEvent(userModel: userModel!));
                      }),
                  CustomSelectContainer(
                      icon: Icons.audio_file, title: 'Voice', onTap: () {}),
                  CustomSelectContainer(
                      icon: Icons.contact_page_rounded,
                      title: 'Contact',
                      onTap: () {}),
                  // PickerImage(
                  //   finalcontext: finalcontext,
                  //   userModel: userModel,
                  // )
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}

// class PickerImage extends StatelessWidget {
//   PickerImage({super.key, required this.finalcontext, this.userModel});
//   BuildContext? finalcontext;
//   UserModel? userModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BlocBuilder<ImagePickerBloc, ImagePickerState>(
//           builder: (_, state) {
//             if (state is ImagePickerLoadingState) {
//               return SizedBox();
//             } else if (state is ImagePickerloadedState) {
//               Navigator.pop(context);
//               Timer(Duration(milliseconds: 500), () {
//                 showDialog(
//                     context: finalcontext!,
//                     builder: (context) => Container(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.file(
//                                 state.imgFile!,
//                                 height: 200,
//                                 width: 250,
//                                 fit: BoxFit.cover,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   MyElevatedButton(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                         context
//                                             .read<ImagePickerBloc>()
//                                             .add(DeletePickedImageEvent());
//                                       },
//                                       btName: 'Discard',
//                                       bgColor: UIColors.greyShade200),
//                                   MyElevatedButton(
//                                       onTap: () {
//                                         Navigator.pop(context);

//                                         context
//                                             .read<ImagePickerBloc>()
//                                             .add(DeletePickedImageEvent());
//                                       },
//                                       btName: 'Send',
//                                       bgColor: UIColors.primary),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ));
//               });
//             } else if (state is ImagePickerErrorState) {
//               return Text(state.erroMsg);
//             }
//             return SizedBox();
//           },
//         ),
//       ],
//     );
//   }
// }

class CustomSelectContainer extends StatelessWidget {
  CustomSelectContainer({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  VoidCallback onTap;
  String title;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: UIColors.greyShade200,
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Icon(
            icon,
            color: UIColors.primary,
            size: 32,
          ),
          Text(title)
        ]),
      ),
    );
  }
}

Container IndictorLine() {
  return Container(
    width: 70,
    height: 5,
    decoration: BoxDecoration(
        color: UIColors.black, borderRadius: BorderRadius.circular(15)),
  );
}
