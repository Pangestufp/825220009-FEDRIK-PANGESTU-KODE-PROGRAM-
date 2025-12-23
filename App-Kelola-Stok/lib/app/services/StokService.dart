import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class StokService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllHistory() async {
    final response = await _apiService.getRequest(EndPoints.kelolaStokGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> gethistoryById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.kelolaStokGetById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<List<dynamic>> cekStok(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.kelolaStokCekOpName, body);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> Koreksi(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.kelolaStokKoreksi, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }



}