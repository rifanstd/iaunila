class JurusanModel {
  String? id_sms;
  String? nm_jns_sms;
  String? nm_lemb;
  String? id_fak_unila;
  String? stat_prodi;
  String? id_jns_sms;

  JurusanModel(
    this.id_sms,
    this.nm_jns_sms,
    this.nm_lemb,
    this.id_fak_unila,
    this.stat_prodi,
    this.id_jns_sms,
  );

  JurusanModel.fromJson(Map<String, dynamic> json) {
    id_sms = json['id_sms'];
    nm_jns_sms = json['nm_jns_sms'];
    nm_lemb = json['nm_lemb'];
    id_fak_unila = json['id_fak_unila'];
    stat_prodi = json['stat_prodi'];
    id_jns_sms = json['id_jns_sms'];
  }
}
