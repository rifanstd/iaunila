import 'package:iaunila/api/iaunila_service.dart';

class DetailProdiModel {
  String? id_sms;
  String? nm_jns_sms;
  String? nama_lembaga;
  String? id_fak_unila;
  String? id_jur_unila;
  String? kode_prodi;
  String? no_tel;
  String? no_fax;
  String? email;
  String? tgl_berdiri;
  String? sks_lulus;
  String? gelar_lulusan;
  String? stat_prodi;
  String? nm_jenj_didik;
  String? id_jns_sms;
  String? id_wil;
  String? id_induk_sms;
  String? waktu_data_ditambahkan;
  String? terakhir_diubah;


  DetailProdiModel(
      this.id_sms,
      this.nm_jns_sms,
      this.nama_lembaga,
      this.id_fak_unila,
      this.id_jur_unila,
      this.kode_prodi,
      this.no_tel,
      this.no_fax,
      this.email,
      this.tgl_berdiri,
      this.sks_lulus,
      this.gelar_lulusan,
      this.stat_prodi,
      this.nm_jenj_didik,
      this.id_jns_sms,
      this.id_wil,
      this.id_induk_sms,
      this.waktu_data_ditambahkan,
      this.terakhir_diubah,
      );

  DetailProdiModel.fromJson(Map<String, dynamic> json){
    id_sms = json['id_sms'];
    nm_jns_sms = json['nm_jns_sms'];
    nama_lembaga = json['nm_lemb'];
    id_fak_unila = json['id_fak_unila'];
    id_jur_unila = json['id_jur_unila'];
    kode_prodi = json['kode_prodi'];
    no_tel = json['no_tel'];
    no_fax = json['no_fax'];
    email = json['email'];
    tgl_berdiri = json['tgl_berdiri'];
    sks_lulus = json['sks_lulus'];
    gelar_lulusan = json['gelar_lulusan'];
    stat_prodi = json['stat_prodi'];
    nm_jenj_didik = json['nm_jenj_didik'];
    id_jns_sms = json['id_jns_sms'];
    id_wil = json['id_wil'];
    id_induk_sms = json['id_induk_sms'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }

  static Future<String>showNamaProdi(String id_prodi) async {
    var prodi = await IaunilaService.getDetailProdi(id_prodi);
    String nama_prodi = prodi[0].nama_lembaga.toString();
    print(nama_prodi);
    return nama_prodi;
  }
}
