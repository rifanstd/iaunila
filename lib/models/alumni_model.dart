class AlumniModel {
  String? id_reg;
  String? nama_alumni;
  String? agama;
  String? jenis_kelamin;
  String? npm;
  String? id_prodi;
  String? angkatan;
  String? ipk;
  String? tanggal_wisuda;
  double? lama_study;

  AlumniModel(
    this.id_reg,
    this.nama_alumni,
    this.agama,
    this.jenis_kelamin,
    this.npm,
    this.id_prodi,
    this.angkatan,
    this.ipk,
    this.tanggal_wisuda,
    this.lama_study,
  );

  AlumniModel.fromJson(Map<String, dynamic> json){
    id_reg = json['id_reg'];
    nama_alumni = json['nama_alumni'];
    agama = json['agama'];
    jenis_kelamin = json['jenis_kelamin'];
    npm = json['npm'];
    id_prodi = json['id_prodi'];
    angkatan = json['angkatan'];
    ipk = json['ipk'];
    tanggal_wisuda = json['tanggal_wisuda'];
    lama_study = double.parse(json['lama_studi']);
  }
}
