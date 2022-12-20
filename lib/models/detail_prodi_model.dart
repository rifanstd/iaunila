import 'package:iaunila/api/iaunila_service.dart';

class DetailProdiModel {
  String? id_sms;
  String? nama_lembaga;
  String? stat_prodi;
  String? sks_lulus;

  DetailProdiModel(
    this.id_sms,
    this.nama_lembaga,
    this.stat_prodi,
    this.sks_lulus,
  );

  DetailProdiModel.fromJson(Map<String, dynamic> json){
    id_sms = json['id_sms'];
    nama_lembaga = json['nm_lemb'];
    stat_prodi = json['stat_prodi'];
    sks_lulus = json['sks_lulus'];
  }

  static Future<String>showNamaProdi(String id_prodi) async {
    var prodi = await IaunilaService.getDetailProdi(id_prodi);
    String nama_prodi = prodi[0].nama_lembaga.toString();
    print(nama_prodi);
    return nama_prodi;
  }
}
