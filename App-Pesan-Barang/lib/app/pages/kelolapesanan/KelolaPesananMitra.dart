import 'package:aplikasipemesananpulaubaru/app/controllers/PesananController.dart';
import 'package:aplikasipemesananpulaubaru/shared/routes/Routes.dart';
import 'package:aplikasipemesananpulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaPesananMitra extends GetView<PesananController> {
  const KelolaPesananMitra({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Styles.secondaryColor,
        appBar: AppBar(
          title: const Text(
            'Kelola Pesanan Partner',
            style: TextStyle(color: Styles.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: Styles.tertiaryColor,
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Styles.primaryColor),
          bottom: const TabBar(
            labelColor: Styles.primaryColor,
            isScrollable: true,
            tabs: [
              Tab(text: "Unsend"),
              Tab(text: "Draft"),
              Tab(text: "Disetujui"),
              Tab(text: "Ditolak"),
              Tab(text: "Selesai"),
              Tab(text: "Returned"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildUnsendTab(),
            _buildStatusTab('draft'),
            _buildStatusTab('disetujui'),
            _buildStatusTab('ditolak'),
            _buildStatusTab('selesai'),
            _buildStatusTab('returned'),
          ],
        ),
      ),
    );
  }

  Widget _buildUnsendTab() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final list = controller.pesananTertundaList;

      if (list.isEmpty) {
        return const Center(child: Text("Tidak ada pesanan unsend"));
      }

      return ListView(
        children: list
            .asMap()
            .entries
            .map((entry) => _buildDraftOfflineCard(entry.key, entry.value))
            .toList(),
      );
    });
  }

  Widget _buildStatusTab(String status) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final list = controller.getPesananByStatus(status);

      if (list.isEmpty) {
        return Center(child: Text("Tidak ada pesanan $status"));
      }

      return ListView(
        children: list.map((item) => _buildOnlinePesananCard(item)).toList(),
      );
    });
  }

  Widget _buildOnlinePesananCard(dynamic pesanan) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Styles.primaryColor.withOpacity(0.1),
        child: const Icon(Icons.receipt_long, color: Styles.primaryColor),
      ),
      title: Text(
        pesanan['id_transaksi'] ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama: ${pesanan['name'] ?? '-'}"),
          Text(
            "Status: ${pesanan['statuspesanan']}",
            style: TextStyle(
              color: Styles.getStatusColor(pesanan['statuspesanan']),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Tanggal: ${Styles.formatDate(pesanan['createat'])}"),
        ],
      ),
      onTap: () {
        controller.selectedid_transaksi.value = pesanan['id_transaksi'];
        Get.toNamed(
          Routes.KELOLA_PESANAN_MITRA_ACTION,
          arguments: {
            "header": pesanan,
            "detailList": pesanan["detail"],
          },
        );
      },
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Total", style: TextStyle(fontSize: 12, color: Colors.grey)),
          Text(
            Styles.formatMoneyRp(pesanan['total']),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }


  Widget _buildDraftOfflineCard(int index, dynamic pesanan) {
    final detailList = pesanan['detail'] ?? [];

    int parseInt(dynamic v) => int.tryParse(v.toString()) ?? 0;
    double parseDouble(dynamic v) => double.tryParse(v.toString()) ?? 0;

    final totalJumlah = detailList.fold(0, (s, item) => s + parseInt(item['jumlah']));
    final totalHarga = detailList.fold(0, (s, item) => s + (parseInt(item['jumlah']) * parseDouble(item['hargajual'])));

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Styles.primaryColor.withOpacity(0.1),
          child: const Icon(Icons.cloud_off, color: Styles.primaryColor),
        ),
        title: Text("Draft-${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Total Qty: $totalJumlah | Total Harga: ${Styles.formatMoneyRp(totalHarga.toString())}"),
        onTap: () => _showPesananTertundaDetail(Get.context!, detailList),
      ),
    );
  }





  void _showPesananTertundaDetail(BuildContext context, List<dynamic> detailList) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text("Detail Pesanan Tertunda"),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: detailList.length,
            itemBuilder: (context, index) {
              final item = detailList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Barang: ${item['namatext']}"),
                    Text("ID Barang: ${item['id_barang']}"),
                    Text("Jumlah: ${item['jumlah']}"),
                    Text("Harga: ${Styles.formatMoneyRp(item['hargajual'])}"),
                    const Divider(),
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }

}
