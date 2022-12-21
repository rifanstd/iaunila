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

  BukuAjarModel.fromMap(Map<String, dynamic> map) {
    id_buku_ajar = map['id_buku_ajar'];
    judul_buku = map['judul_buku'];
    isbn = map['isbn'];
    tanggal_terbit = map['tanggal_terbit'];
    penerbit = map['penerbit'];
    waktu_data_ditambahkan = map['waktu_data_ditambahkan'];
    terakhir_diubah = map['terakhir_diubah'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['id_buku_ajar'] = id_buku_ajar;
    map['judul_buku'] = judul_buku;
    map['isbn'] = isbn;
    map['tanggal_terbit'] = tanggal_terbit;
    map['penerbit'] = penerbit;
    map['waktu_data_ditambahkan'] = waktu_data_ditambahkan;
    map['terakhir_diubah'] = terakhir_diubah;

    return map;
  }
}
