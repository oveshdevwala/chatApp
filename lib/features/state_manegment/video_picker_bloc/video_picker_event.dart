// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'video_picker_bloc.dart';

@immutable
sealed class VideoPickerEvent {}

class PickVideoEvent extends VideoPickerEvent {
 UserModel userModel;
  PickVideoEvent({
    required this.userModel,
  });
}
class DeletePickedVideoEvent extends VideoPickerEvent {
 
}
