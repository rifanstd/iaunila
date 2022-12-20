import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iaunila/models/models.dart';

class IaunilaService {
  static String? token;

  static Future<List<AlumniModel>> getAllAlumni() async {
    getToken();
    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_alumni?page=1&limit=50&sort_by=ASC&tahun_lulus=2022&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2';

    var header = {"Authorization": "bearer${token}"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("data tidak null");
        final alumnis = <AlumniModel>[];
        json['data'].forEach((v) {
          alumnis.add(AlumniModel.fromJson(v));
        });

        // Testing
        for (int i = 0; i < alumnis.length; i++) {
          print(i.toString() + ' ' + alumnis[i].nama_alumni.toString());
        }

        // Testing
        if (alumnis != null && alumnis.isNotEmpty) {
          alumnis.sort((a, b) => b.ipk.toString().compareTo(a.ipk.toString()));
          // print(alumnis.last.ipk);
        }

        return alumnis;
      } else {
        print("Data Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<List<AlumniModel>> getLulusanTerbaik() async {
    List<AlumniModel> lulusanTerbaik = [];

    await getAllAlumni().then((value) {
      lulusanTerbaik.clear();
      for (int i = 0; i < 3; i++) {
        lulusanTerbaik.add(value[i]);
      }
    });

    return lulusanTerbaik;
  }

  static Future<List<MahasiswaModel>> getAllMahasiswa(int page) async {
    getToken();

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$page&limit=50&sort_by=ASC&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2';

    var header = {"Authorization": "bearer${token}"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("data tidak null");
        final mahasiswas = <MahasiswaModel>[];
        json['data'].forEach((v) {
          mahasiswas.add(MahasiswaModel.fromJson(v));
        });

        // Testing
        for (int i = 0; i < mahasiswas.length; i++) {
          print(i.toString() + ' ' + mahasiswas[i].nama_mahasiswa.toString());
        }

        return mahasiswas;
      } else {
        print("Data Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<List<ProdiModel>> getAllProdi(int page) async {
    getToken();

    var header = {"Authorization": "bearer${token}"};

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/lembaga/profil_prodi/daftar?page=${page.toString()}&limit=50&sort_by=DESC';

    var response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("Data ada");
        final prodis = <ProdiModel>[];

        json['data'].forEach((v) {
          prodis.add(ProdiModel.fromJson(v));
        });

        return prodis;
      } else {
        print("Data tidak ada");
        return [];
      }
    } else {
      throw ('Connection Gagal');
    }
  }

  static Future<List<DetailProdiModel>> getDetailProdi(String id_prodi) async {
    getToken();

    var header = {"Authorization": "bearer${token}"};

    int page = 1;

    for (page; page <= 5; page++) {
      var url =
          'http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_prodi/detail?page=${page.toString()}&limit=50&sort_by=DESC';

      var response = await http.get(
        headers: header,
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json['data'] != null) {
          final detailProdis = <DetailProdiModel>[];
          for (final v in json['data']) {
            if (v['id_sms'] == id_prodi) {
              detailProdis.add(DetailProdiModel.fromJson(v));
              return detailProdis;
            }
          }
        } else {
          print("Data Null");
          return [];
        }
      } else {
        throw ('Gagal terkoneksi');
      }
    }
    return [];
  }

  static Future<List<JurusanModel>> getAllJurusan() async {
    getToken();

    var url = 'http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga';

    var header = {"Authorization": "bearer$token"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("data jurusan tidak null");
        final jurusans = <JurusanModel>[];
        json['data'].forEach((v) {
          if(v['id_jns_sms'] == '2') {
            jurusans.add(JurusanModel.fromJson(v));
          }
        });

        // Testing
        for (int i = 0; i < jurusans.length; i++) {
          print(i.toString() + ' ' + jurusans[i].nm_lemb.toString());
        }

        return jurusans;
      } else {
        print("Data Jurusan Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<void> getToken() async {
    const String username = 'mhs-testing';
    const String password = 'unilajaya';

    const String url = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';

    var apiResult = await http.post(Uri.parse(url), body: {
      "id_aplikasi": "948df317-78f7-4b92-a53f-0a56215e07de",
      "username": username,
      "password": password
    });

    var jsonObject = json.decode(apiResult.body);
    String _token = jsonObject['data']['token'].toString();

    token = _token;
  }
}
