import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class PesananService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllPesanan() async {
    final response = await _apiService.getRequest(EndPoints.pesananGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> Review(Map<String, dynamic> body, String id) async {
    final response = await _apiService.postRequest(EndPoints.pesananReview+"/"+id, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> Setuju(String id) async {
    final response = await _apiService.postRequest(EndPoints.pesananSetuju+"/"+id, {});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> Tolak(String id) async {
    final response = await _apiService.postRequest(EndPoints.pesananTolak+"/"+id, {});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> Selesai(String id) async {
    final response = await _apiService.postRequest(EndPoints.pesananSelesai+"/"+id, {});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getPesananById(String id) async {
    final response = await _apiService.getRequest("${EndPoints.pesananGetById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


}
