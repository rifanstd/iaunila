class MataKuliahModel {
  String? id_kurikulum_sp;
  String? id_mk;
  String? id_sms;
  String? nm_prodi;
  String? kode_mk;
  String? nm_mk;
  String? sks_mk;
  String? status;
  String? semester;
  String? waktu_data_ditambahkan;
  String? terakhir_diubah;

  MataKuliahModel(
    this.id_kurikulum_sp,
    this.id_mk,
    this.id_sms,
    this.nm_prodi,
    this.kode_mk,
    this.nm_mk,
    this.sks_mk,
    this.status,
    this.semester,
    this.waktu_data_ditambahkan,
    this.terakhir_diubah,
  );

  MataKuliahModel.fromJson(Map<String, dynamic> json) {
    id_kurikulum_sp = json['id_kurikulum_sp'];
    id_mk = json['id_mk'];
    id_sms = json['id_sms'];
    nm_prodi = json['nm_prodi'];
    kode_mk = json['kode_mk'];
    nm_mk = json['nm_mk'];
    sks_mk = json['sks_mk'];
    status = json['status'];
    semester = json['semester'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }
}
