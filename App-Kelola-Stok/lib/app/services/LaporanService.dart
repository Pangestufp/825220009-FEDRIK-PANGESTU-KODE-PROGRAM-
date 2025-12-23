import 'dart:io';
import 'package:aplikasiinventorytokopulaubaru/app/services/ApiService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';

class LaporanService {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> checkLaporan(String tahun, String bulan1, String bulan2) async {

    //Laporan/GetData?tahun=2025&bulan_awal=08&bulan_akhir=09
    String para = "?tahun="+tahun+"&bulan_awal="+bulan1+"&bulan_akhir="+bulan2;
    final response = await _apiService.getRequest(EndPoints.laporanData+para);
    if (response.isNotEmpty) {
      return response;
    }
    return [];
  }

  Future<Map<String, dynamic>?> inputOmset(Map<String, dynamic> body) async {
    final response = await _apiService.postRequest(EndPoints.laporanInsert, body);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getLog() async {
    final response =
    await _apiService.getRequest(EndPoints.laporanGetLog);
    if (response.isNotEmpty) {
      return response.first;
    }
    return null;
  }
}
