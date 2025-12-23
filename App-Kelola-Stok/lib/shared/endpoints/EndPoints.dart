abstract class EndPoints {
  static const String url= "http://103.67.244.45";
  //static const String url= "http://192.168.43.179:8000";
  static const String baseUrl = "$url/api";
  static const String imageUrl = "$url/";

  // ---------------- AUTH ----------------
  static const String login = "$baseUrl/Auth/Login";
  static const String register = "$baseUrl/Auth/Register";
  static const String logout = "$baseUrl/Auth/Logout";

  // ---------------- PENGGUNA ----------------
  static const String penggunaUpdateStatus = "$baseUrl/Pengguna/UpdateStatus";
  static const String penggunaGetAll = "$baseUrl/Pengguna/GetAll";
  static const String penggunaUpdate = "$baseUrl/Pengguna/Update";
  static const String penggunaMyData = "$baseUrl/Pengguna/GetMyData";
  static const String penggunaGetById = "$baseUrl/Pengguna/GetById";

  // ---------------- PROFIL TOKO ----------------
  static const String profilTokoUpdate = "$baseUrl/ProfilToko/Update";
  static const String profilTokoGet = "$baseUrl/ProfilToko/Get";

  // ---------------- PERUSAHAAN ----------------
  static const String perusahaanCreate = "$baseUrl/Perusahaan/Create";
  static const String perusahaanUpdate = "$baseUrl/Perusahaan/Update";
  static const String perusahaanUpdateStatus = "$baseUrl/Perusahaan/UpdateStatus";
  static const String perusahaanReadAll = "$baseUrl/Perusahaan/ReadAll";
  static const String perusahaanReadById = "$baseUrl/Perusahaan/ReadById";

  // ---------------- SUPPLIER ----------------
  static const String supplierCreate = "$baseUrl/Supplier/Create";
  static const String supplierUpdate = "$baseUrl/Supplier/Update";
  static const String supplierUpdateStatus = "$baseUrl/Supplier/UpdateStatus";
  static const String supplierReadAll = "$baseUrl/Supplier/ReadAll";
  static const String supplierReadById = "$baseUrl/Supplier/ReadById";

  // ---------------- KATEGORI ----------------
  static const String kategoriCreate = "$baseUrl/Kategori/Create";
  static const String kategoriUpdate = "$baseUrl/Kategori/Update";
  static const String kategoriUpdateStatus = "$baseUrl/Kategori/UpdateStatus";
  static const String kategoriReadAll = "$baseUrl/Kategori/ReadAll";
  static const String kategoriReadById = "$baseUrl/Kategori/ReadById";

  // ---------------- SUB KATEGORI ----------------
  static const String subKategoriCreate = "$baseUrl/SubKategori/Create";
  static const String subKategoriUpdate = "$baseUrl/SubKategori/Update";
  static const String subKategoriUpdateStatus = "$baseUrl/SubKategori/UpdateStatus";
  static const String subKategoriReadAll = "$baseUrl/SubKategori/ReadAll";
  static const String subKategoriReadById = "$baseUrl/SubKategori/ReadById";

  // ---------------- BRAND ----------------
  static const String brandCreate = "$baseUrl/Brand/Create";
  static const String brandUpdate = "$baseUrl/Brand/Update";
  static const String brandUpdateStatus = "$baseUrl/Brand/UpdateStatus";
  static const String brandReadAll = "$baseUrl/Brand/ReadAll";
  static const String brandReadById = "$baseUrl/Brand/ReadById";

  // ---------------- SATUAN ----------------
  static const String satuanCreate = "$baseUrl/Satuan/Create";
  static const String satuanUpdate = "$baseUrl/Satuan/Update";
  static const String satuanUpdateStatus = "$baseUrl/Satuan/UpdateStatus";
  static const String satuanReadAll = "$baseUrl/Satuan/ReadAll";
  static const String satuanReadById = "$baseUrl/Satuan/ReadById";

  // ---------------- UKURAN ----------------
  static const String ukuranCreate = "$baseUrl/Ukuran/Create";
  static const String ukuranUpdate = "$baseUrl/Ukuran/Update";
  static const String ukuranUpdateStatus = "$baseUrl/Ukuran/UpdateStatus";
  static const String ukuranReadAll = "$baseUrl/Ukuran/ReadAll";
  static const String ukuranReadById = "$baseUrl/Ukuran/ReadById";

  // ---------------- Varian ----------------
  static const String varianCreate = "$baseUrl/Varian/Create";
  static const String varianUpdate = "$baseUrl/Varian/Update";
  static const String varianUpdateStatus = "$baseUrl/Varian/UpdateStatus";
  static const String varianReadAll = "$baseUrl/Varian/ReadAll";
  static const String varianReadById = "$baseUrl/Varian/ReadById";

  // ---------------- TIPE ----------------
  static const String tipeCreate = "$baseUrl/Tipe/Create";
  static const String tipeUpdate = "$baseUrl/Tipe/Update";
  static const String tipeUpdateStatus = "$baseUrl/Tipe/UpdateStatus";
  static const String tipeReadAll = "$baseUrl/Tipe/ReadAll";
  static const String tipeReadById = "$baseUrl/Tipe/ReadById";

  // ---------------- BARANG ----------------
  static const String barangCreate = "$baseUrl/Barang/Create";
  static const String barangUpdate = "$baseUrl/Barang/Update";
  static const String barangUpdateStatus = "$baseUrl/Barang/UpdateStatus";
  static const String barangReadAll = "$baseUrl/Barang/ReadAll";//ReadAllWithPrice
  static const String barangReadAllWithPrice = "$baseUrl/Barang/ReadAllWithPrice";
  static const String barangReadAllWithPartPrice = "$baseUrl/Barang/ReadAllWithPartnerPrice";
  static const String barangReadById = "$baseUrl/Barang/ReadById";
  static const String barangGetRekomendasiAll = "$baseUrl/Prediksi/Get";

  // ---------------- HARGA BARANG ----------------
  static const String hargaBarangCreate = "$baseUrl/HargaBarang/Create";
  static const String hargaBarangUpdate = "$baseUrl/HargaBarang/Update";
  static const String hargaBarangUpdateStatus = "$baseUrl/HargaBarang/UpdateStatus";
  static const String hargaBarangReadByIdBarangByIDPararel = "$baseUrl/HargaBarang/ReadByIdBarangByIDPararel";
  static const String hargaBarangReadById = "$baseUrl/HargaBarang/ReadById";

  // ---------------- KELOLA STOK ----------------
  static const String kelolaStokCekOpName = "$baseUrl/KelolaStok/CekOpName";
  static const String kelolaStokKoreksi = "$baseUrl/KelolaStok/Koreksi";
  static const String kelolaStokGetAll = "$baseUrl/KelolaStok/GetAll";
  static const String kelolaStokGetById = "$baseUrl/KelolaStok/GetById";


  // ---------------- FAKTUR PEMBELIAN ----------------
  static const String fakturCreate = "$baseUrl/TambahFaktur/Create";
  static const String fakturUpdate = "$baseUrl/TambahFaktur/Update";
  static const String fakturGetAll = "$baseUrl/TambahFaktur/GetAll";
  static const String fakturGetById = "$baseUrl/TambahFaktur/GetById";
  static const String fakturGetDetailById = "$baseUrl/TambahFaktur/GetDetailById";

  // ---------------- BARANG KELUAR ----------------
  static const String barangKeluarCreate = "$baseUrl/TambahBarangKeluar/Create";
  static const String barangKeluarGetAll = "$baseUrl/TambahBarangKeluar/GetAll";
  static const String barangKeluarGetById = "$baseUrl/TambahBarangKeluar/GetById";
  static const String barangKeluarGetDetailById = "$baseUrl/TambahBarangKeluar/GetDetailById";

  // ---------------- RETUR BARANG ----------------
  static const String returCreate = "$baseUrl/ReturBarang/Create";
  static const String returGetAll = "$baseUrl/ReturBarang/GetAll";
  static const String returGetById = "$baseUrl/ReturBarang/GetById";
  static const String returGetDetailById = "$baseUrl/ReturBarang/GetDetailById";
  static const String returGetAvaiById = "$baseUrl/ReturBarang/GetAvaiById";

  // PESANAN PARTNER
  static const String pesananCreate = "$baseUrl/Pesanan/Create";
  static const String pesananTolak = "$baseUrl/Pesanan/Tolak";
  static const String pesananSetuju = "$baseUrl/Pesanan/Setuju";
  static const String pesananSelesai = "$baseUrl/Pesanan/Selesai";
  static const String pesananReview = "$baseUrl/Pesanan/Review";
  static const String pesananGetAll = "$baseUrl/Pesanan/GetAll";
  static const String pesananGetByUser = "$baseUrl/Pesanan/GetByUser";
  static const String pesananGetById = "$baseUrl/Pesanan/GetById";

// LAPORAN KEUANGAN
  static const String laporanCreate = "$baseUrl/Laporan/Create";
  static const String laporanData = "$baseUrl/Laporan/GetData";
  static const String laporanInsert = "$baseUrl/Laporan/Insert";
  static const String laporanGetLog = "$baseUrl/Laporan/GetLog";

  // ---------------- SUPPLIER ----------------
  static const String tesCreate = "$baseUrl/Tes/Create";
  static const String tesUpdate = "$baseUrl/Tes/Update";
  static const String tesUpdateStatus = "$baseUrl/Tes/UpdateStatus";
  static const String tesReadAll = "$baseUrl/Tes/ReadAll";
  static const String tesReadById = "$baseUrl/Tes/ReadById";


  static const String laporanPrintData = "$baseUrl/Laporan/PrintData";

}
