import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class FakturPembelianService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllfaktur() async {
    final response = await _apiService.getRequest(EndPoints.fakturGetAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getFakturById(int id) async {
    final response =
    await _apiService.getRequest("${EndPoints.fakturGetById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<List<dynamic>> getFakturDetailById(int id) async {
    final response =
    await _apiService.getRequest("${EndPoints.fakturGetDetailById}/$id");
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> tambahFaktur(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.fakturCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateFaktur(int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.fakturUpdate}/$id", {});
      print(response);
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
