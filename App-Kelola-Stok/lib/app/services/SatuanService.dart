import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class SatuanService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllSatuan() async {
    final response = await _apiService.getRequest(EndPoints.satuanReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getSatuanById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.satuanReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusSatuan(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.satuanUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahSatuan(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.satuanCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateSatuan(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.satuanUpdate}/$id", body);
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