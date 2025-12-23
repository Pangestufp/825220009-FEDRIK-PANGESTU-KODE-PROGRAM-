import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class ReturService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllRetur() async {
    final response = await _apiService.getRequest(EndPoints.returGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> tambahRetur(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.returCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  //getReturDetailById

  Future<List<dynamic>> getReturDetailById(int id) async {
    final response =
    await _apiService.getRequest("${EndPoints.returGetDetailById}/$id");
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<List<dynamic>> getAvaiById(int id) async {
    final response =
    await _apiService.getRequest("${EndPoints.returGetAvaiById}/$id");
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

}
