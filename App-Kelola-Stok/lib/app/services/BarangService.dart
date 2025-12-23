import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class BarangService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllBarang() async {
    final response = await _apiService.getRequest(EndPoints.barangReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<List<dynamic>> getAllRekomendasiBarang() async {
    final response = await _apiService.getRequest(EndPoints.barangGetRekomendasiAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }


  Future<List<dynamic>> getAllBarangWithPrice() async {
    final response = await _apiService.getRequest(EndPoints.barangReadAllWithPrice);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getBarangById(int id) async {
    final response =
        await _apiService.getRequest("${EndPoints.barangReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusBarang(int id) async {
    final response = await _apiService
        .patchRequest("${EndPoints.barangUpdateStatus}/$id", {});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> tambahBarang(
    Map<String, dynamic> body, {
    File? file,
  }) async {
    final response = await _apiService.postMultipartRequest(
      EndPoints.barangCreate,
      body,
      file: file,
      fileKey: "image",
    );

    print(body);
    print(response);

    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateBarang(
    Map<String, dynamic> body,
    int id, {
    File? file,
  }) async {
    try {
      final response = await _apiService.postMultipartRequest(
        "${EndPoints.barangUpdate}/$id",
        body,
        file: file,
        fileKey: "image",
      );

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
