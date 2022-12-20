class ProdiModel {
  String? id_sms;
  String? nama_prodi;
  String? id_akreditasi_prodi;
  String? sk_akreditasi_prodi;
  String? tanggal_sk_akreditasi_prodi;
  String? nama_lembaga;
  String? nama_akreditasi;
  String? visi;
  String? misi;
  String? tujuan;
  String? sasaran;
  String? kompetensi;
  String? himp_alumni;

  ProdiModel(
    this.id_sms,
    this.nama_prodi,
    this.id_akreditasi_prodi,
    this.sk_akreditasi_prodi,
    this.tanggal_sk_akreditasi_prodi,
    this.nama_lembaga,
    this.nama_akreditasi,
    this.visi,
    this.misi,
    this.tujuan,
    this.sasaran,
    this.kompetensi,
    this.himp_alumni,
  );

  ProdiModel.fromJson(Map<String, dynamic> json){
    id_sms = json['id_sms'];
    nama_prodi = json['nm_prodi'];
    id_akreditasi_prodi = json['id_akreditasi_prodi'];
    sk_akreditasi_prodi = json['sk_akreditasi_prodi'];
    tanggal_sk_akreditasi_prodi = json['tanggal_sk_akreditasi_prodi'];
    nama_lembaga = json['nm_lemb'];
    nama_akreditasi = json['nm_akred'];
    visi = json['visi'];
    misi = json['misi'];
    tujuan = json['tujuan'];
    sasaran = json['sasaran'];
    kompetensi = json['kompetensi'];
    himp_alumni = json['himp_alumni'];
  }
}
