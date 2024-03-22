import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:meta/meta.dart';

part 'video_picker_event.dart';
part 'video_picker_state.dart';

class VideoPickerBloc extends Bloc<VideoPickerEvent, VideoPickerState> {
  FirebaseProvider firebaseProvider;
  VideoPickerBloc({required this.firebaseProvider})
      : super(VideoPickerInitial()) {
    XFile? video;
    on<PickVideoEvent>((event, emit) async {
      try {
        video = await ImagePicker().pickVideo(source: ImageSource.gallery);
        if (video != null) {
          firebaseProvider.sendFileMessage(
              imageMsg: false,
              videoMsg: true,
              userModel: event.userModel,
              file: File(video!.path));
          emit(VideoPickerLoadedState());
          video = null;
        }
      } catch (e) {
        emit(VideoPickerErrorState(errorMsg: e.toString()));
      }
    });

    on<DeletePickedVideoEvent>(
      (event, emit) {
        video = null;
        emit(VideoPickerLoadingState());
      },
    );
  }
}
