import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/app/shared/models/file_model.dart';
import 'package:frontend/app/shared/models/user_model.dart';
import 'package:frontend/app/shared/repositories/api_repository.dart';

class HomeController {
  HomeController(this.user, this._api) {
    getAllFilesFromUser();
  }

  final UserModel user;
  final ApiRepository _api;
  final ValueNotifier<List<FileModel>> files$ =
      ValueNotifier<List<FileModel>>(null);
  MultipartFile fileToUpload;

  Future<void> getAllFilesFromUser() async {
    final List<FileModel> files = await _api.getAllFilesFromUser(user.id);
    files$.value = List.from(files);
  }

  void setUploadFile(MultipartFile file) {
    fileToUpload = file;
  }

  Future<void> uploadFile() async {
    final FormData formData = FormData();
    formData.files.addAll([
      MapEntry('file', fileToUpload),
    ]);
    files$.value = null;
    await _api.uploadFile(formData, user.id);
    getAllFilesFromUser();
  }
}
