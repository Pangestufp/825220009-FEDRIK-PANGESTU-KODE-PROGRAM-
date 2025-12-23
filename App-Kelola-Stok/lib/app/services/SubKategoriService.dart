import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class SubKategoriService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllSubKategori() async {
    final response = await _apiService.getRequest(EndPoints.subKategoriReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getSubKategoriById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.subKategoriReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusSubKategori(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.subKategoriUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahSubKategori(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.subKategoriCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateSubKategori(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.subKategoriUpdate}/$id", body);
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