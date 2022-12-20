class FakultasModel {
  String? id_sms;
  String? nm_jns_sms;
  String? nm_lemb;
  String? id_jns_sms;

  FakultasModel(this.id_sms, this.nm_jns_sms, this.nm_lemb, this.id_jns_sms,);

  FakultasModel.fromJson(Map<String, dynamic> json) {
    id_sms = json['id_sms'];
    nm_jns_sms = json['nm_jns_sms'];
    nm_lemb = json['nm_lemb'];
    id_jns_sms = json['id_jns_sms'];
  }
}