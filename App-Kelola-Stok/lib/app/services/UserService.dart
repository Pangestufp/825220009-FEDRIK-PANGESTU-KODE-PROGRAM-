import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class UserService {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> getMyData() async {
    final response = await _apiService.getRequest(EndPoints.penggunaMyData);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<List<dynamic>> getAllUsers() async {
    final response = await _apiService.getRequest(EndPoints.penggunaGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.penggunaGetById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusUser(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.penggunaUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahUser(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.register, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateUser(Map<String, dynamic> body, int id) async {
    print("=== UserService.updateUser($id) ===");
    print("URL: ${EndPoints.penggunaUpdate}/$id");
    print("Body: $body");

    try {
      final response = await _apiService.patchRequest("${EndPoints.penggunaUpdate}/$id", body);
      print("Raw response: $response");
      print("Response type: ${response.runtimeType}");
      print("Response length: ${response.length}");

      if (response.isNotEmpty) {
        print("Response first item: ${response.first}");
        return response.first;
      } else {
        print("Response is empty!");
        return null;
      }
    } catch (e) {
      print("Exception in UserService: $e");
      rethrow;
    }
  }


}