import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';

class UserProfileDataProvider extends ChangeNotifier {
  bool _muteNotification = false;
  get muteNotification => _muteNotification;
  set muteNotification(value) {
    _muteNotification = value;
    notifyListeners();
  }

  updateNotificationStatus({required bool value, required String toId}) {
    FirebaseProvider.updateNoticiationStatus(value: value, toId: toId);
    _muteNotification = value;
    notifyListeners();
  }
}

class CurrentProfilePictureProvider extends ChangeNotifier {
  File? _pickedFile;
  File? get pickerFile => _pickedFile;
  set pickerFile(value) {
    _pickedFile = value;
    notifyListeners();
  }

  CroppedFile? _cropedFile;
  CroppedFile? get cropedFile => _cropedFile;
  set cropedFile(value) {
    _pickedFile = value;
    notifyListeners();
  }

  chooseFile(BuildContext context) async {
    var picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _cropedFile = await ImageCropper().cropImage(
        sourcePath: picked.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Image',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
    
    }
  }
  uploadProfileFile(BuildContext context) async {
    if (_cropedFile != null) {
      
    await FirebaseProvider().uploadProfilePicture(
        profileFile: File(_cropedFile!.path), context: context);
    }
    _cropedFile = null;
    _pickedFile = null;
    notifyListeners();
  }
}
