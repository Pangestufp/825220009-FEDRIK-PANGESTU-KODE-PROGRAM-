import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class KategoriService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllKategori() async {
    final response = await _apiService.getRequest(EndPoints.kategoriReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getKategoriById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.kategoriReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusKategori(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.kategoriUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahKategori(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.kategoriCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateKategori(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.kategoriUpdate}/$id", body);
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