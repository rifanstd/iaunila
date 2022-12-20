class MahasiswaModel {
  String? id_peserta_didik;
  String? id_reg_pd;
  String? program_studi;
  String? npm;
  String? nama_mahasiswa;
  String? id_prodi;
  String? periode_masuk;
  String? semester_sekarang;
  String? ips;
  String? ipk;
  String? total_sks;
  String? status;

  MahasiswaModel(
    this.id_peserta_didik,
    this.id_reg_pd,
    this.program_studi,
    this.npm,
    this.nama_mahasiswa,
    this.id_prodi,
    this.periode_masuk,
    this.semester_sekarang,
    this.ips,
    this.ipk,
    this.total_sks,
    this.status,
  );

  MahasiswaModel.fromJson(Map<String, dynamic> json) {
    id_peserta_didik = json['id_peserta_didik'];
    id_reg_pd = json['id_reg_pd'];
    program_studi = json['program_studi'];
    npm = json['NPM'];
    nama_mahasiswa = json['nama_mahasiswa'];
    id_prodi = json['id_prodi'];
    periode_masuk = json['periode_masuk'];
    semester_sekarang = json['semester_sekarang'];
    ips = json['ips'];
    ipk = json['ipk'];
    total_sks = json['total_sks'];
    status = json['status'];
  }
}
