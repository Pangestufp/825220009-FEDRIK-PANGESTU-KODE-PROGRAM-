import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class SupplierService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getAllSupplier() async {
    final response = await _apiService.getRequest(EndPoints.supplierReadAll);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> getSupplierById(int id) async {
    final response = await _apiService.getRequest("${EndPoints.supplierReadById}/$id");
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateStatusSupplier(int id) async {
    final response = await _apiService.patchRequest("${EndPoints.supplierUpdateStatus}/$id",{});
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }


  Future<Map<String, dynamic>?> tambahSupplier(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.supplierCreate, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateSupplier(Map<String, dynamic> body, int id) async {
    try {
      final response = await _apiService.patchRequest("${EndPoints.supplierUpdate}/$id", body);
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