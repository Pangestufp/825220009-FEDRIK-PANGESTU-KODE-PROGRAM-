import 'package:aplikasiinventorytokopulaubaru/app/controllers/LaporanController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class KelolaLaporanKeuanganDownload extends GetView<LaporanController> {
  const KelolaLaporanKeuanganDownload({super.key});

  Future<void> _selectMonth(
      BuildContext context, Rx<DateTime?> selectedDate) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMMM yyyy');
    final Rx<DateTime?> bulanAwal = Rx<DateTime?>(null);
    final Rx<DateTime?> bulanAkhir = Rx<DateTime?>(null);

    return Scaffold(
      appBar: Styles.bar("Laporan Keuangan"),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              decoration: Styles.radiusDownTertiary,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(() => GestureDetector(
                      onTap: () => _selectMonth(context, bulanAwal),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Styles.secondaryColor,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          bulanAwal.value == null
                              ? "Pilih Periode Awal"
                              : dateFormat.format(bulanAwal.value!),
                          style: TextStyle(
                            color: bulanAwal.value == null ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(height: 12),
                    Obx(() => GestureDetector(
                      onTap: () async {
                        if (bulanAwal.value == null) {
                          Get.snackbar(
                            "Info",
                            "Pilih bulan awal terlebih dahulu sebelum bulan akhir",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        final DateTime? picked = await showMonthPicker(
                          context: context,
                          initialDate: bulanAkhir.value ?? bulanAwal.value!,
                          firstDate: DateTime(bulanAwal.value!.year, 1),
                          lastDate: DateTime(bulanAwal.value!.year, 12),
                        );

                        if (picked != null) {
                          bulanAkhir.value = picked;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Styles.secondaryColor,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          bulanAkhir.value == null
                              ? "Pilih Periode Akhir"
                              : dateFormat.format(bulanAkhir.value!),
                          style: TextStyle(
                            color: bulanAkhir.value == null ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          if (bulanAwal.value == null || bulanAkhir.value == null) {
                            Get.snackbar(
                              "Peringatan",
                              "Silakan pilih bulan awal dan bulan akhir",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }

                          if (bulanAwal.value!.year != bulanAkhir.value!.year) {
                            Get.snackbar(
                              "Peringatan",
                              "Bulan awal dan akhir harus dalam tahun yang sama",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }

                          final tahun = bulanAwal.value!.year.toString();
                          final bulan1 = DateFormat('MM').format(bulanAwal.value!);
                          final bulan2 = DateFormat('MM').format(bulanAkhir.value!);

                          await controller.cekLaporanCustom(tahun, bulan1, bulan2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: const Text("Buat Laporan"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),



            const SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.laporanList.isEmpty) {
                  return const Center(
                      child: Text("Belum ada data laporan ditemukan"));
                }

                return ListView.builder(
                  itemCount: controller.laporanList.length,
                  itemBuilder: (context, index) {
                    final laporan = controller.laporanList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: 90,
                          child: Column(
                            children: [
                              Text(
                                _formatWaktuBulan(laporan['waktu']) ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                _formatWaktuTahun(laporan['waktu']) ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Uang Masuk: ${Styles.formatMoneyRp(laporan['cashflowin'])}"),
                            Text("Uang Keluar: ${Styles.formatMoneyRp(laporan['cashflowout'])}"),
                            Text("Laba Bersih: ${Styles.formatMoneyRp(laporan['lababersih'])}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
              () => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: controller.isLoading.value
                ? null
                : () {
              controller.openLaporanPDF();
            },
            child: controller.isLoading.value
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                Text("Loading"),
              ],
            )
                : const Text("Download"),
          ),
        ),
      ),
    );
  }

  String _formatWaktuBulan(String? waktu) {
    if (waktu == null || waktu.isEmpty) return "-";

    try {
      final date = DateFormat('yyyy-MM').parse(waktu);
      final bulan = DateFormat('MMMM').format(date);
      return "$bulan";
    } catch (e) {
      return waktu;
    }
  }

  String _formatWaktuTahun(String? waktu) {
    if (waktu == null || waktu.isEmpty) return "-";

    try {
      final date = DateFormat('yyyy-MM').parse(waktu);
      final tahun = DateFormat('yyyy').format(date);
      return "$tahun";
    } catch (e) {
      return waktu;
    }
  }

}
