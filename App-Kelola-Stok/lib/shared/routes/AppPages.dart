import 'package:aplikasiinventorytokopulaubaru/app/bindings/AuthBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/BarangBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/BarangKeluarController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/BarangMasukBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/BrandBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/HargaBarangBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/KategoriBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/LaporanBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/MenuUtamaBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/PenggunaBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/PerusahaanBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/PesananBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/ProfilTokoBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/ReturBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/SatuanBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/StokBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/SubKategoriBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/SupplierBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/TesBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/TipeBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/UkuranBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/bindings/VarianBinding.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/ErrorPage.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/LoginView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/MenuUtamaView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangkeluar/KelolaBarangKeluarAddView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangkeluar/KelolaBarangKeluarCartView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangkeluar/KelolaBarangKeluarDetail.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangkeluar/KelolaBarangKeluarView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukAddView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukCartView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukDetailView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukMenu.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangretur/KelolaBarangReturAdd.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangretur/KelolaBarangReturCart.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangretur/KelolaBarangReturDetailView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangretur/KelolaBarangReturView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/KelolaDataView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaKategori/DetailKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaKategori/EditKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaKategori/KelolaKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaKategori/TambahKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabarang/DetailBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabarang/EditBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabarang/KelolaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabarang/TambahBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabrand/DetailBrandView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabrand/EditBrandView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabrand/KelolaBrandView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolabrand/TambahBrandView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolahargabarang/DetailHargaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolahargabarang/EditHargaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolahargabarang/KelolaHargaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolahargabarang/ListHargaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolahargabarang/TambahHargaBarangView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaperusahaan/DetailPerusahaanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaperusahaan/EditPerusahaanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaperusahaan/KelolaPerusahaanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaperusahaan/TambahPerusahaanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaprofiltoko/DetailProfilTokoView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaprofiltoko/EditProfilTokoView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasatuan/DetailSatuanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasatuan/EditSatuanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasatuan/KelolaSatuanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasatuan/TambahSatuanView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasubkategori/DetailSubKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasubkategori/EditSubKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasubkategori/KelolaSubKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasubkategori/TambahSubKategoriView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasupplier/DetailSupplierView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasupplier/EditSupplierView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasupplier/KelolaSupplierView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolasupplier/TambahSupplierView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolates/DetailTesView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolates/EditTesView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolates/KelolaTesView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolates/TambahTesView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolatipe/DetailTipeView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolatipe/EditTipeView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolatipe/KelolaTipeView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolatipe/TambahTipeView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaukuran/DetailUkuranView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaukuran/EditUkuranView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaukuran/KelolaUkuranView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolaukuran/TambahUkuranView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolauser/DetailUserView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolauser/EditUserView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolauser/KelolaUserView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolauser/TambahUserView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolavarian/DetailVarianView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolavarian/EditVarianView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolavarian/KelolaVarianView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/keloladata/kelolavarian/TambahVarianView.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolalaporan/KelolaInputOmset.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolalaporan/KelolaLaporanKeuangan.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolalaporan/KelolaLaporanKeuanganDownload.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolapesanan/KelolaPesananMitra.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolapesanan/KelolaPesananMitraAction.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolapesanan/KelolaPesananReview.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/HistoryStok.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/HistoryStokDetail.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/KelolaStokMenu.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/LaporanStok.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/StokOpNameInput.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolastok/StokOpNameKoreksi.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = [
    // Login & Menu Utama
    GetPage(
      name: Routes.MENU_LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MENU_UTAMA,
      page: () => MenuUtamaView(),
      binding: MenuUtamaBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DATA,
      page: () => KelolaDataView(),
      binding: MenuUtamaBinding(),
    ),
    // USER
    GetPage(
      name: Routes.KELOLA_USER,
      page: () => KelolaUserView(),
      binding: PenggunaBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_USER,
      page: () => DetailUserView(),
      binding: PenggunaBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_USER,
      page: () => TambahUserView(),
      binding: PenggunaBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_USER,
      page: () => EditUserView(),
      binding: PenggunaBinding(),
    ),

    // PROFIL TOKO
    GetPage(
      name: Routes.KELOLA_DETAIL_PROFILTOKO,
      page: () => DetailProfilTokoView(),
      binding: ProfilTokoBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_PROFILTOKO,
      page: () => EditProfilTokoView(),
      binding: ProfilTokoBinding(),
    ),

    // PERUSAHAAN
    GetPage(
      name: Routes.KELOLA_PERUSAHAAN,
      page: () => KelolaPerusahaanView(),
      binding: PerusahaanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_PERUSAHAAN,
      page: () => TambahPerusahaanView(),
      binding: PerusahaanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_PERUSAHAAN,
      page: () => DetailPerusahaanView(),
      binding: PerusahaanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_PERUSAHAAN,
      page: () => EditPerusahaanView(),
      binding: PerusahaanBinding(),
    ),

    // SUPPLIER
    GetPage(
      name: Routes.KELOLA_SUPPLIER,
      page: () => KelolaSupplierView(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_SUPPLIER,
      page: () => DetailSupplierView(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_SUPPLIER,
      page: () => TambahSupplierView(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_SUPPLIER,
      page: () => EditSupplierView(),
      binding: SupplierBinding(),
    ),

    // KATEGORI
    GetPage(
      name: Routes.KELOLA_KATEGORI,
      page: () => KelolaKategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_KATEGORI,
      page: () => DetailKategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_KATEGORI,
      page: () => TambahKategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_KATEGORI,
      page: () => EditKategoriView(),
      binding: KategoriBinding(),
    ),
    // SUB KATEGORI
    GetPage(
      name: Routes.KELOLA_SUBKATEGORI,
      page: () => KelolaSubKategoriView(),
      binding: SubKategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_SUBKATEGORI,
      page: () => DetailSubKategoriView(),
      binding: SubKategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_SUBKATEGORI,
      page: () => TambahSubKategoriView(),
      binding: SubKategoriBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_SUBKATEGORI,
      page: () => EditSubKategoriView(),
      binding: SubKategoriBinding(),
    ),

    // BRAND
    GetPage(
      name: Routes.KELOLA_BRAND,
      page: () => KelolaBrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_BRAND,
      page: () => TambahBrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_BRAND,
      page: () => DetailBrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_BRAND,
      page: () => EditBrandView(),
      binding: BrandBinding(),
    ),

    // SATUAN
    GetPage(
      name: Routes.KELOLA_SATUAN,
      page: () => KelolaSatuanView(),
      binding: SatuanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_SATUAN,
      page: () => TambahSatuanView(),
      binding: SatuanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_SATUAN,
      page: () => DetailSatuanView(),
      binding: SatuanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_SATUAN,
      page: () => EditSatuanView(),
      binding: SatuanBinding(),
    ),

    // UKURAN
    GetPage(
      name: Routes.KELOLA_UKURAN,
      page: () => KelolaUkuranView(),
      binding: UkuranBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_UKURAN,
      page: () => DetailUkuranView(),
      binding: UkuranBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_UKURAN,
      page: () => TambahUkuranView(),
      binding: UkuranBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_UKURAN,
      page: () => EditUkuranView(),
      binding: UkuranBinding(),
    ),

    // VARIAN
    GetPage(
      name: Routes.KELOLA_VARIAN,
      page: () => KelolaVarianView(),
      binding: VarianBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_VARIAN,
      page: () => DetailVarianView(),
      binding: VarianBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_VARIAN,
      page: () => TambahVarianView(),
      binding: VarianBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_VARIAN,
      page: () => EditVarianView(),
      binding: VarianBinding(),
    ),

    // TIPE
    GetPage(
      name: Routes.KELOLA_TIPE,
      page: () => KelolaTipeView(),
      binding: TipeBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_TIPE,
      page: () => DetailTipeView(),
      binding: TipeBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_TIPE,
      page: () => TambahTipeView(),
      binding: TipeBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_TIPE,
      page: () => EditTipeView(),
      binding: TipeBinding(),
    ),
    // BARANG
    GetPage(
      name: Routes.KELOLA_BARANG,
      page: () => KelolaBarangView(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_BARANG,
      page: () => DetailBarangView(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_BARANG,
      page: () => TambahBarangView(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_BARANG,
      page: () => EditBarangView(),
      binding: BarangBinding(),
    ),

    // HARGA BARANG
    GetPage(
      name: Routes.KELOLA_HARGABARANG,
      page: () => KelolaHargaBarangView(),
      binding: HargaBarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_LIST_HARGABARANG,
      page: () => ListHargaBarangView(),
      binding: HargaBarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_HARGABARANG,
      page: () => DetailHargaBarangView(),
      binding: HargaBarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_HARGABARANG,
      page: () => TambahHargaBarangView(),
      binding: HargaBarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_HARGABARANG,
      page: () => EditHargaBarangView(),
      binding: HargaBarangBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGKELUAR,
      page: () => KelolaBarangKeluarView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGKELUAR_DETAIL,
      page: () => KelolaBarangKeluarDetail(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGKELUAR_ADD,
      page: () => KelolaBarangKeluarAddView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGKELUAR_CART,
      page: () => KelolaBarangKeluarCartView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGMASUK_MENU,
      page: () => KelolaBarangMasukMenu(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGMASUK,
      page: () => KelolaBarangMasukView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGMASUK_ADD,
      page: () => KelolaBarangMasukAddView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGMASUK_CART,
      page: () => KelolaBarangMasukCartView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGMASUK_DETAIL,
      page: () => KelolaBarangMasukDetailView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGRETUR,
      page: () => KelolaBarangReturView(),
      binding: ReturBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGRETUR_ADD,
      page: () => KelolaBarangReturAdd(),
      binding: ReturBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGRETUR_CART,
      page: () => KelolaBarangReturCart(),
      binding: ReturBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_BARANGRETUR_DETAIL,
      page: () => KelolaBarangReturDetailView(),
      binding: ReturBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_HISTORY_STOK,
      page: () => HistoryStok(),
      binding: StokBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_HISTORY_STOK_DETAIL,
      page: () => HistoryStokDetail(),
      binding: StokBinding()
    ),
    GetPage(
      name: Routes.KELOLA_MENU_STOK,
      page: () => KelolaStokMenu(),
      binding: StokBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_LAPORAN_STOK,
      page: () => LaporanStok(),
      binding: StokBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_STOKOPNAME_INPUT,
      page: () => StokOpNameInput(),
      binding: StokBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_STOKOPNAME_KOREKSI,
      page: () => StokOpNameKoreksi(),
      binding: StokBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_LAPORAN_KEUANGAN,
      page: () => KelolaLaporanKeuangan(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_INPUT_OMSET,
      page: () => KelolaInputOmset(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_LAPORAN_KEUANGAN_DOWNLOAD,
      page: () => KelolaLaporanKeuanganDownload(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_PESANAN_MITRA,
      page: () => KelolaPesananMitra(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_PESANAN_MITRA_ACTION,
      page: () => KelolaPesananMitraAction(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_PESANAN_REVIEW,
      page: () => KelolaPesananReview(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: Routes.ERROR,
      page: () => ErrorPage(),
      binding: MenuUtamaBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_TES,
      page: () => KelolaTesView(),
      binding: TesBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_DETAIL_TES,
      page: () => DetailTesView(),
      binding: TesBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_MENAMBAHKAN_TES,
      page: () => TambahTesView(),
      binding: TesBinding(),
    ),
    GetPage(
      name: Routes.KELOLA_EDIT_TES,
      page: () => EditTesView(),
      binding: TesBinding(),
    ),
  ];
}
