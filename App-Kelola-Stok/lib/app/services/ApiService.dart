import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:aplikasiinventorytokopulaubaru/app/services/TokenService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:dio/dio.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/AuthService.dart';
import 'package:get/get.dart';

class ApiService {
  final Dio _dio = Dio();
  final TokenService _tokenService = TokenService();
  final AuthService _authService = AuthService();

  /// GET request
  Future<List<Map<String, dynamic>>> getRequest(String endpoint) async {
    final token = await _tokenService.getToken();
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return _normalizeResponse(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// POST request
  Future<List<Map<String, dynamic>>> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final token = await _tokenService.getToken();
    try {
      final response = await _dio.post(
        endpoint,
        data: jsonEncode(body),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return _normalizeResponse(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// PATCH request
  Future<List<Map<String, dynamic>>> patchRequest(
      String endpoint, Map<String, dynamic> body) async {
    final token = await _tokenService.getToken();
    try {
      final response = await _dio.patch(
        endpoint,
        data: jsonEncode(body),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return _normalizeResponse(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }



  Future<List<Map<String, dynamic>>> postMultipartRequest(
      String endpoint, Map<String, dynamic> body,
      {File? file, String fileKey = "image"}) async {
    final token = await _tokenService.getToken();
    try {
      final formData = dio.FormData.fromMap({
        ...body,
        if (file != null)
          fileKey: await dio.MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
      });


      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );


      return _normalizeResponse(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// PATCH request dengan file (Multipart)
  Future<List<Map<String, dynamic>>> patchMultipartRequest(
      String endpoint, Map<String, dynamic> body,
      {File? file, String fileKey = "image"}) async {
    final token = await _tokenService.getToken();
    try {
      final formData = dio.FormData.fromMap({
        ...body,
        if (file != null)
          fileKey: await dio.MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
      });

      final response = await _dio.patch(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      return _normalizeResponse(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// Normalisasi response jadi List<Map>
  List<Map<String, dynamic>> _normalizeResponse(dynamic data) {
    if (data is List) {
      return data.map((e) => Map<String, dynamic>.from(e)).toList();
    } else if (data is Map) {
      return [Map<String, dynamic>.from(data)];
    } else {
      return [];
    }
  }

  /// Handler kalau error
  List<Map<String, dynamic>> _handleError(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;

    String? message;

    if (data is Map<String, dynamic>) {
      message = data['message'] ??
          data['error'] ??
          data['msg'] ??
          "Terjadi kesalahan yang tidak diketahui.";
    } else {
      message = "Terjadi kesalahan jaringan atau server tidak merespon.";
    }

    // Handle sesuai kode
    if (status == 401) {
      _forceLogout();
      Get.snackbar(
        "Error",
        "Akun anda sedang login diperangkat lain",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (status == 413) {
      Get.snackbar(
        "Gagal",
        "Gambar terlalu besar",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (status == 422) {
      Get.snackbar(
        "Validasi Gagal",
        message ?? "Data tidak valid",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return [];
  }

  /// Paksa logout & redirect ke login
  Future<void> _forceLogout() async {
    await _authService.logout();
    Get.offAllNamed(Routes.MENU_LOGIN);
  }
}
