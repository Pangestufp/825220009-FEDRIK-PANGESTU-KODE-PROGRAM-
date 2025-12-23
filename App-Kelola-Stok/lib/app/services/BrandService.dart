import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class BrandService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllbrand() async {
    final response = await _apiService.getRequest(EndPoints.brandReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getbrandById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.brandReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusBrand(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.brandUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahBrand(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.brandCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateBrand(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.brandUpdate}/$id", body);
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