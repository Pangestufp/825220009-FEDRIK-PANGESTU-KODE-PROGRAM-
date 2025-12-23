import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class PerusahaanService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllPerusahaan() async {
    final response = await _apiService.getRequest(EndPoints.perusahaanReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getPerusahaanById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.perusahaanReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusPerusahaan(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.perusahaanUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahPerusahaan(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.perusahaanCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updatePerusahaan(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.perusahaanUpdate}/$id", body);
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