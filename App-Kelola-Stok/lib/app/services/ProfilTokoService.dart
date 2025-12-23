import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class ProfilTokoService {
  final ApiService _apiService = ApiService();


  Future<Map<String, dynamic>?> getProfilToko() async {
    final response = await _apiService.getRequest(EndPoints.profilTokoGet);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateProfilToko(Map<String, dynamic> body) async {
    try {
      final response = await _apiService.patchRequest(EndPoints.profilTokoUpdate,body);
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