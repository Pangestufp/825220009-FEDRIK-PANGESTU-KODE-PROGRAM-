import 'package:aplikasiinventorytokopulaubaru/app/controllers/AuthController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/MenuUtamaController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuUtamaView extends GetView<MenuUtamaController> {
  const MenuUtamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Styles.tertiaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      drawer: Drawer(
        child: Obx(
              () {
            final userName = controller.user.value?['name'] ?? 'Pengguna';
            final userEmail = controller.user.value?['email'] ??
                'email@example.com';

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Styles.primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                            Icons.person, size: 40, color: Styles.primaryColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userEmail,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildMenuItem2(
                  label: 'Pesanan Partner',
                  onTap: () {
                final role = controller.user.value?['role'] ?? '';
                  if (role.toLowerCase() == 'karyawan') {
                    controller.clearSearch();
                    Get.toNamed(Routes.ERROR);
                  } else {
                    controller.clearSearch();
                    Get.toNamed(Routes.KELOLA_PESANAN_MITRA);
                  }
                }
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Get.back();
                    controller.logoutAndRedirect();
                  },
                ),
              ],
            );
          },
        ),
      ),

      body: Obx(() {
        if (controller.isLoadingUser.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Styles.primaryColor),
                SizedBox(height: 12),
                Text("Memuat data pengguna...",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Styles.tertiaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    final list = controller.barangList;

                    if (list.isEmpty) {
                      return const Center(
                        child: Text("Belum ada data barang."),
                      );
                    }


                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final item = list[index]['data'].toString();
                            final parts = item.split('_');
                            final namaProduk = parts.isNotEmpty
                                ? parts[0]
                                : "-";
                            final detail = parts.length > 1 ? parts[1] : "-";
                            final detail2 = parts.length > 2 ? parts[2] : "-";

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: _buildProductCard(
                                  namaProduk, detail, detail2),
                            );
                          },
                        ),
                      ),
                    );
                  })

              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildSearchMenuFinal(context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildMenuItem(
                        icon: Icons.folder,
                        label: 'Kelola Data',
                        onTap: () {
                          final role = controller.user.value?['role'] ?? '';
                          if (role.toLowerCase() == 'karyawan') {
                            controller.clearSearch();
                            Get.toNamed(Routes.ERROR);
                          } else {
                            controller.clearSearch();
                            Get.toNamed(Routes.KELOLA_DATA);
                          }
                        }
                    ),
                    _buildMenuItem(
                        icon: Icons.input,
                        label: 'Pembelian',
                        onTap: () {
                          final role = controller.user.value?['role'] ?? '';
                          if (role.toLowerCase() == 'karyawan') {
                            controller.clearSearch();
                            Get.toNamed(Routes.ERROR);
                          } else {
                            controller.clearSearch();
                            Get.toNamed(Routes.KELOLA_BARANGMASUK_MENU);
                          }
                        }
                    ),
                    _buildMenuItem(
                      icon: Icons.output,
                      label: 'Penjualan',
                      onTap: () {
                        controller.clearSearch();
                        Get.toNamed(Routes.KELOLA_BARANGKELUAR);
                        },
                    ),
                    _buildMenuItem(
                      icon: Icons.fact_check_outlined,
                      label: 'Koreksi Stok',
                      onTap: () {
                        controller.clearSearch();
                        Get.toNamed(Routes.KELOLA_MENU_STOK);},
                    ),
                    _buildMenuItem(
                      icon: Icons.attach_money,
                      label: 'Laporan Keuangan',
                      onTap: () {
                        final role = controller.user.value?['role'] ?? '';
                        if (role.toLowerCase() == 'karyawan') {
                          controller.clearSearch();
                          Get.toNamed(Routes.ERROR);
                        } else {
                          controller.clearSearch();
                          Get.toNamed(Routes.KELOLA_LAPORAN_KEUANGAN);
                        }
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.keyboard_return,
                      label: 'Retur Barang',
                      onTap: () {
                        controller.clearSearch();
                        Get.toNamed(Routes.KELOLA_BARANGRETUR);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProductCard(String name, String dtl1, String dtl2) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Styles.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_up_alt_rounded,
              color: Styles.primaryColor,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Styles.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dtl1,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dtl2,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Styles.secondaryColor),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Styles.secondaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildMenuItem2({
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.receipt_rounded, color: Styles.primaryColor,),
        title: Text(
          label,
          style: TextStyle(
            color: Styles.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.open_in_new_rounded,
          color: Styles.primaryColor,
        ),
      ),
    );
  }


  /*Widget _buildSearchMenu(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final RxString query = ''.obs;

    List<Map<String, String>> getMenuListByRole(String role) {
      switch (role.toLowerCase()) {
        case 'pemilik':
          return [
            {"title": "Kelola Data", "route": Routes.KELOLA_DATA},
            {"title": "Kelola User", "route": Routes.KELOLA_USER},
            {"title": "Profil Toko", "route": Routes.KELOLA_DETAIL_PROFILTOKO},
            {"title": "Kelola Perusahaan", "route": Routes.KELOLA_PERUSAHAAN},
            {"title": "Kelola Supplier", "route": Routes.KELOLA_SUPPLIER},
            {"title": "Kelola Kategori", "route": Routes.KELOLA_KATEGORI},
            {"title": "Kelola Subkategori", "route": Routes.KELOLA_SUBKATEGORI},
            {"title": "Kelola Brand", "route": Routes.KELOLA_BRAND},
            {"title": "Kelola Satuan", "route": Routes.KELOLA_SATUAN},
            {"title": "Kelola Ukuran", "route": Routes.KELOLA_UKURAN},
            {"title": "Kelola Varian", "route": Routes.KELOLA_VARIAN},
            {"title": "Kelola Tipe", "route": Routes.KELOLA_TIPE},
            {"title": "Kelola Barang", "route": Routes.KELOLA_BARANG},
            {
              "title": "Kelola Harga Barang",
              "route": Routes.KELOLA_HARGABARANG
            },
            {
              "title": "Menu Barang Masuk",
              "route": Routes.KELOLA_BARANGMASUK_MENU
            },
            {"title": "Barang Masuk", "route": Routes.KELOLA_BARANGMASUK},
            {
              "title": "Tambah Barang Masuk",
              "route": Routes.KELOLA_BARANGMASUK_ADD
            },
            {"title": "Barang Keluar", "route": Routes.KELOLA_BARANGKELUAR},
            {"title": "Barang Retur", "route": Routes.KELOLA_BARANGRETUR},
            {"title": "Menu Stok", "route": Routes.KELOLA_MENU_STOK},
            {
              "title": "Input Stok Opname",
              "route": Routes.KELOLA_STOKOPNAME_INPUT
            },
            {"title": "History Stok", "route": Routes.KELOLA_HISTORY_STOK},
            {"title": "Laporan Stok", "route": Routes.KELOLA_LAPORAN_STOK},
            {
              "title": "Laporan Keuangan",
              "route": Routes.KELOLA_LAPORAN_KEUANGAN
            },
            {
              "title": "Download Laporan Keuangan",
              "route": Routes.KELOLA_LAPORAN_KEUANGAN_DOWNLOAD
            },
            {"title": "Input Omset", "route": Routes.KELOLA_INPUT_OMSET},
            {"title": "Pesanan Mitra", "route": Routes.KELOLA_PESANAN_MITRA},
          ];
        default:
          return [
            {"title": "Barang Keluar", "route": Routes.KELOLA_BARANGKELUAR},
            {"title": "Barang Retur", "route": Routes.KELOLA_BARANGRETUR},
            {"title": "Menu Stok", "route": Routes.KELOLA_MENU_STOK},
            {
              "title": "Input Stok Opname",
              "route": Routes.KELOLA_STOKOPNAME_INPUT
            },
            {"title": "History Stok", "route": Routes.KELOLA_HISTORY_STOK},
            {"title": "Laporan Stok", "route": Routes.KELOLA_LAPORAN_STOK},
          ];
      }
    }
    return Obx(() {
      final role = controller.user.value?['role'] ?? '';


      final menuList = getMenuListByRole(role);

      final filtered = menuList
          .where((item) =>
          item["title"]!.toLowerCase().contains(query.value.toLowerCase()))
          .toList();

      return Column(
        children: [
          TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Cari menu",
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: Styles.primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) => query.value = value,
          ),
          const SizedBox(height: 10),
          if (query.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return ListTile(
                    title: Text(item["title"]!,
                        style: const TextStyle(
                            color: Styles.primaryColor,
                            fontWeight: FontWeight.w600)),
                    onTap: () {
                      _controller.clear();
                      query.value = '';
                      FocusScope.of(context).unfocus();
                      Get.toNamed(item["route"]!);
                    },
                  );
                },
              ),
            ),
        ],
      );
    });
  }*/

  Widget _buildSearchMenuFinal(BuildContext context) {

    List<Map<String, String>> getMenuListByRole(String role) {
      switch (role.toLowerCase()) {
        case 'pemilik':
          return [
            {"title": "Kelola Data", "route": Routes.KELOLA_DATA},
            {"title": "Kelola User", "route": Routes.KELOLA_USER},
            {"title": "Profil Toko", "route": Routes.KELOLA_DETAIL_PROFILTOKO},
            {"title": "Kelola Perusahaan", "route": Routes.KELOLA_PERUSAHAAN},
            {"title": "Kelola Supplier", "route": Routes.KELOLA_SUPPLIER},
            {"title": "Kelola Kategori", "route": Routes.KELOLA_KATEGORI},
            {"title": "Kelola Subkategori", "route": Routes.KELOLA_SUBKATEGORI},
            {"title": "Kelola Brand", "route": Routes.KELOLA_BRAND},
            {"title": "Kelola Satuan", "route": Routes.KELOLA_SATUAN},
            {"title": "Kelola Ukuran", "route": Routes.KELOLA_UKURAN},
            {"title": "Kelola Varian", "route": Routes.KELOLA_VARIAN},
            {"title": "Kelola Tipe", "route": Routes.KELOLA_TIPE},
            {"title": "Kelola Barang", "route": Routes.KELOLA_BARANG},
            {
              "title": "Kelola Harga Barang",
              "route": Routes.KELOLA_HARGABARANG
            },
            {
              "title": "Menu Barang Masuk",
              "route": Routes.KELOLA_BARANGMASUK_MENU
            },
            {"title": "Barang Masuk", "route": Routes.KELOLA_BARANGMASUK},
            {
              "title": "Tambah Barang Masuk",
              "route": Routes.KELOLA_BARANGMASUK_ADD
            },
            {"title": "Barang Keluar", "route": Routes.KELOLA_BARANGKELUAR},
            {"title": "Barang Retur", "route": Routes.KELOLA_BARANGRETUR},
            {"title": "Menu Stok", "route": Routes.KELOLA_MENU_STOK},
            {
              "title": "Input Stok Opname",
              "route": Routes.KELOLA_STOKOPNAME_INPUT
            },
            {"title": "History Stok", "route": Routes.KELOLA_HISTORY_STOK},
            {"title": "Laporan Stok", "route": Routes.KELOLA_LAPORAN_STOK},
            {
              "title": "Laporan Keuangan",
              "route": Routes.KELOLA_LAPORAN_KEUANGAN
            },
            {
              "title": "Download Laporan Keuangan",
              "route": Routes.KELOLA_LAPORAN_KEUANGAN_DOWNLOAD
            },
            {"title": "Input Omset", "route": Routes.KELOLA_INPUT_OMSET},
            {"title": "Pesanan Mitra", "route": Routes.KELOLA_PESANAN_MITRA},
          ];
        default:
          return [
            {"title": "Barang Keluar", "route": Routes.KELOLA_BARANGKELUAR},
            {"title": "Barang Retur", "route": Routes.KELOLA_BARANGRETUR},
            {"title": "Menu Stok", "route": Routes.KELOLA_MENU_STOK},
            {
              "title": "Input Stok Opname",
              "route": Routes.KELOLA_STOKOPNAME_INPUT
            },
            {"title": "History Stok", "route": Routes.KELOLA_HISTORY_STOK},
            {"title": "Laporan Stok", "route": Routes.KELOLA_LAPORAN_STOK},
          ];
      }
    }

    return Obx(() {
      final role = controller.user.value?['role'] ?? '';
      final menuList = getMenuListByRole(role);

      final filtered = menuList
          .where((item) => item["title"]!
          .toLowerCase()
          .contains(controller.searchQuery.value.toLowerCase()))
          .toList();

      return Column(
        children: [
          TextField(
            controller: controller.searchController,
            focusNode: controller.searchFocus,                 // ← PENTING
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Cari menu",
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: const Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: Styles.primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) => controller.searchQuery.value = value,
          ),

          const SizedBox(height: 10),

          if (controller.searchQuery.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const Divider(height: 0),
                itemBuilder: (context, index) {
                  final item = filtered[index];

                  return ListTile(
                    title: Text(
                      item["title"]!,
                      style: const TextStyle(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      controller.clearSearch();          // Hapus + unfocus stabil

                      Future.delayed(const Duration(milliseconds: 30), () {
                        Get.toNamed(item["route"]!);


                      });
                    },
                  );
                },
              ),
            ),
        ],
      );
    });
  }


}

