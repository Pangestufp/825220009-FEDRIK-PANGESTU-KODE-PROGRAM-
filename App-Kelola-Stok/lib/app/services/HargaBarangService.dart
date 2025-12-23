import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class HargaBarangService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllByIdBarang(int id) async {
    final response = await _apiService.getRequest("${EndPoints.hargaBarangReadById}/$id");
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getAllByIdBarangIdPararel(String id) async {
    final response = await _apiService.getRequest("${EndPoints.hargaBarangReadByIdBarangByIDPararel}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusHarga(String id) async {
    final response = await _apiService.patchRequest("${EndPoints.hargaBarangUpdateStatus}/${id}",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahHarga(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.hargaBarangCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateHarga(Map<String, dynamic> body, String id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.hargaBarangUpdate}/$id", body);
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