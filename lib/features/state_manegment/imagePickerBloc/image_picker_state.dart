// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

class ImagePickerloadedState extends ImagePickerState {

}

class ImagePickerLoadingState extends ImagePickerState {}

class ImagePickerErrorState extends ImagePickerState {
  String erroMsg;
  ImagePickerErrorState({
    required this.erroMsg,
  });
  
}
