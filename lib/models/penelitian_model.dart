class PenelitianModel {
  String? id;
  String? judul_penelitian;
  String? bidang_keilmuan;
  String? tahun_pelaksanaan;
  String? lama_kegiatan;
  String? waktu_data_ditambahkan;
  String? terakhir_diubah;

  PenelitianModel(
    this.id,
    this.judul_penelitian,
    this.bidang_keilmuan,
    this.tahun_pelaksanaan,
    this.lama_kegiatan,
    this.waktu_data_ditambahkan,
    this.terakhir_diubah,
  );

  PenelitianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul_penelitian = json['judul_penelitian'];
    bidang_keilmuan = json['bidang_keilmuan'];
    tahun_pelaksanaan = json['tahun_pelaksanaan'];
    lama_kegiatan = json['lama_kegiatan'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }
}
