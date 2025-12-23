import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class TesService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllTes() async {
    final response = await _apiService.getRequest(EndPoints.tesReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getTesById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.tesReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusTes(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.tesUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahTes(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.tesCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateTes(Map<String, dynamic> body, int id) async {
    try {
      print('jalan 2');
      final response = await _apiService.patchRequest("${EndPoints.tesUpdate}/$id", body);
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