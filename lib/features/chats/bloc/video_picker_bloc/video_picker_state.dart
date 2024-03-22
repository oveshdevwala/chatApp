// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'video_picker_bloc.dart';

@immutable
sealed class VideoPickerState {}

final class VideoPickerInitial extends VideoPickerState {}

class VideoPickerLoadingState extends VideoPickerState {}

class VideoPickerLoadedState extends VideoPickerState {

}

class VideoPickerErrorState extends VideoPickerState {
  String errorMsg;
  VideoPickerErrorState({
    required this.errorMsg,
  });
}
