import 'dart:convert';
import 'package:aplikasiinventorytokopulaubaru/app/services/TokenService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final TokenService _tokenService = TokenService();

  /// LOGIN pakai email & password → return true kalau berhasil
  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        EndPoints.login,
        data: jsonEncode({
          "email": email,
          "password": password,
        }),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      final data = response.data;

      // Kalau API return langsung string (token)
      if (data is String) {
        await _tokenService.saveToken(data);
        return true;
      }

      return false; // kalau tidak sesuai
    } catch (e) {
      return false; // kalau error
    }
  }


  /// LOGOUT → return true kalau berhasil
  Future<bool> logout() async {
    try {
      final token = await _tokenService.getToken();

      final response = await _dio.post(
        EndPoints.logout,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      // Hapus token setelah logout
      await _tokenService.deleteToken();

      // anggap sukses kalau status code 200
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}