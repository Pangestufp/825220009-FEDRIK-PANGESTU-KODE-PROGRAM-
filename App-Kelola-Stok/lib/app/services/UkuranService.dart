import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class UkuranService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllUkuran() async {
    final response = await _apiService.getRequest(EndPoints.ukuranReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getUkuranById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.ukuranReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusUkuran(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.ukuranUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahUkuran(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.ukuranCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateUkuran(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.ukuranUpdate}/$id", body);
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