class BukuAjarModel {
  String? id_buku_ajar;
  String? judul_buku;
  String? isbn;
  String? tanggal_terbit;
  String? penerbit;
  String? waktu_data_ditambahkan;
  String? terakhir_diubah;

  BukuAjarModel(
    this.id_buku_ajar,
    this.judul_buku,
    this.isbn,
    this.tanggal_terbit,
    this.penerbit,
    this.waktu_data_ditambahkan,
    this.terakhir_diubah,
  );

  BukuAjarModel.fromJson(Map<String, dynamic> json) {
    id_buku_ajar = json['id_buku_ajar'];
    judul_buku = json['judul_buku'];
    isbn = json['isbn'];
    tanggal_terbit = json['tanggal_terbit'];
    penerbit = json['penerbit'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }
}
