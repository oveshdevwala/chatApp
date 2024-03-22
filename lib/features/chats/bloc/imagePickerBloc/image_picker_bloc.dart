import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  FirebaseProvider firebaseProvider;
  ImagePickerBloc({required this.firebaseProvider})
      : super(ImagePickerInitial()) {
    XFile? image;
    // CroppedFile? Cropedimage;
    on<PickImageEvent>((event, emit) async {
      emit(ImagePickerLoadingState());
      try {
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          firebaseProvider.sendFileMessage(
              imageMsg: true,
              videoMsg: false,
              userModel: event.userModel,
              file: File(image!.path));
          emit(ImagePickerloadedState());
          image = null;
        }
      } catch (e) {
        emit(ImagePickerErrorState(erroMsg: e.toString()));
      }
    });

    on<DeletePickedImageEvent>((event, emit) {
      image = null;
      // Cropedimage = null;
      emit(ImagePickerLoadingState());
    });
  }
}


// Image Crop After Selection
        //   Cropedimage = await ImageCropper()
        //       .cropImage(sourcePath: image!.path, aspectRatioPresets: [
        //     CropAspectRatioPreset.square,
        //     CropAspectRatioPreset.ratio3x2,
        //     CropAspectRatioPreset.original,
        //     CropAspectRatioPreset.ratio4x3,
        //     CropAspectRatioPreset.ratio16x9
        //   ], uiSettings: [
        //     AndroidUiSettings(
        //         toolbarTitle: 'Crop Image',
        //         toolbarColor: UIColors.primary,
        //         toolbarWidgetColor: UIColors.white,
        //         initAspectRatio: CropAspectRatioPreset.original,
        //         lockAspectRatio: false),
        //     IOSUiSettings(title: 'Crop Image')
        //   ]).then((value) {
          
        //     return;
        //   });