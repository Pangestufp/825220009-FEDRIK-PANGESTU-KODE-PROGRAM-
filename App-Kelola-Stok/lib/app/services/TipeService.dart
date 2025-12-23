import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class TipeService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAlltipe() async {
    final response = await _apiService.getRequest(EndPoints.tipeReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getTipeById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.tipeReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusTipe(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.tipeUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahTipe(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.tipeCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateTipe(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.tipeUpdate}/$id", body);
      if (response.isNotEmpty) {
        return response.first;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }


}