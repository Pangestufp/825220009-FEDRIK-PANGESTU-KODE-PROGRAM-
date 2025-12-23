import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class VarianService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllVarian() async {
    final response = await _apiService.getRequest(EndPoints.varianReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getVarianById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.varianReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusVarian(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.varianUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahVarian(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.varianCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateVarian(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.varianUpdate}/$id", body);
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