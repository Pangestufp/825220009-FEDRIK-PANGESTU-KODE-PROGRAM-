import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class BarangKeluarService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllBarangKeluar() async {
    final response = await _apiService.getRequest(EndPoints.barangKeluarGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getBarangKeluarById(int id) async {
    final response =
    await _apiService.getRequest("${EndPoints.barangKeluarGetById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<List<dynamic>> getBarangKeluarDetailById(String id) async {
    final response =
    await _apiService.getRequest("${EndPoints.barangKeluarGetDetailById}/$id");
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> tambahBarangKeluar(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.barangKeluarCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }
}
