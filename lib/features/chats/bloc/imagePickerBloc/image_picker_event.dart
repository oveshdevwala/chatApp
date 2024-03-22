// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {}

class PickImageEvent extends ImagePickerEvent {
  UserModel userModel;
  PickImageEvent({
    required this.userModel,
  });
}

class DeletePickedImageEvent extends ImagePickerEvent {}
