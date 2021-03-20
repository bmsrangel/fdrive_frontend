import 'package:dio/dio.dart';
import 'package:frontend/app/shared/models/file_model.dart';
import 'package:frontend/app/shared/models/user_model.dart';

class ApiRepository {
  ApiRepository(this._dio);

  final Dio _dio;

  Future<UserModel> login(String email, String senha) async {
    final Response response = await _dio.post('/users/login', data: {
      'email': email,
      'password': senha,
    });

    return UserModel.fromMap(response.data);
  }

  Future<List<FileModel>> getAllFilesFromUser(int userId) async {
    final Response response = await _dio.get('/files/$userId');
    return (response.data as List)
        .map((fileData) => FileModel.fromMap(fileData))
        .toList();
  }

  Future<void> uploadFile(FormData formData, int userId) async {
    await _dio.post('/files/upload/$userId', data: formData);
  }
}
