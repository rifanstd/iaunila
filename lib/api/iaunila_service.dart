import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iaunila/models/models.dart';

class IaunilaService {
  static String? token;

  static Future<List<MahasiswaModel>> getAllMahasiswa(String idProdi) async {
    getToken();
    int page = 1;
    final mahasiswas = <MahasiswaModel>[];

    while (true) {
      var url =
          'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$page&limit=50&sort_by=ASC&id_prodi=$idProdi';
      var header = {"Authorization": "bearer$token"};
      final response = await http.get(
        headers: header,
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json['data'] != null) {
          print("Data mahasiswa tidak null");
          json['data'].forEach((v) {
            mahasiswas.add(MahasiswaModel.fromJson(v));
          });
        } else {
          print("Data mahasiswa null");
          break;
        }
      } else {
        throw ('Gagal terkoneksi');
      }
      print(page);
      page++;
    }

    return mahasiswas;
  }

  static Future<List<ProdiModel>> getAllProdi() async {
    getToken();
    int page = 1;
    final prodis = <ProdiModel>[];

    while (true) {
      var url =
          'http://onedata.unila.ac.id/api/live/0.1/lembaga/profil_prodi/daftar?page=$page&limit=50&sort_by=DESC';

      var header = {"Authorization": "bearer$token"};

      var response = await http.get(
        headers: header,
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json['data'].length != 0) {
          print("Data prodi tidak null");
          json['data'].forEach((v) {
            prodis.add(ProdiModel.fromJson(v));
          });
        } else {
          print("Data prodi null");
          break;
        }
      } else {
        throw ('Connection Gagal');
      }
      page++;
    }

    return prodis;
  }

  static Future<List<DetailProdiModel>> getDetailProdi(String nm_lemb) async {
    getToken();

    var header = {"Authorization": "bearer${token}"};

    var url = 'http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga';

    var response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        final detailProdis = <DetailProdiModel>[];
        for (final v in json['data']) {
          if (v['id_jns_sms'] == '3' && v['nm_lemb'].toString().toLowerCase() == nm_lemb.toLowerCase()) {
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
          if (v['id_jns_sms'] == '2') {
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

  static Future<List<FakultasModel>> getAllFakultas() async {
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
        print("data fakultas tidak null");
        final faculties = <FakultasModel>[];
        json['data'].forEach((v) {
          if (v['id_jns_sms'] == '1') {
            faculties.add(FakultasModel.fromJson(v));
          }
        });

        // Testing
        for (int i = 0; i < faculties.length; i++) {
          print(i.toString() + ' ' + faculties[i].nm_lemb.toString());
        }

        return faculties;
      } else {
        print("Data fakultas Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<FakultasModel> getNamaFakultasByID(String _id) async {
    List<FakultasModel> fakultas = [];

    await getAllFakultas().then((value) {
      value.forEach((element) {
        if (element.id_sms.toString() == _id) {
          print(element.nm_lemb);
          fakultas.add(element);
        }
      });
    });

    return fakultas.first;
  }

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

  static Future<List<AlumniModel>> getAllAlumniByPage(int page) async {
    getToken();
    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_alumni?page=$page&limit=50&sort_by=ASC&tahun_lulus=2022&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2';

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

  static Future<List<MataKuliahModel>> getAllMataKuliah(int page) async {
    getToken();

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/mata_kuliah/list_matkul?page=$page&limit=50&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2';

    var header = {"Authorization": "bearer${token}"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("data matkul tidak null");
        final matkuls = <MataKuliahModel>[];
        json['data'].forEach((v) {
          matkuls.add(MataKuliahModel.fromJson(v));
        });

        // Testing
        for (int i = 0; i < matkuls.length; i++) {
          print(i.toString() + ' ' + matkuls[i].nm_mk.toString());
        }

        return matkuls;
      } else {
        print("Data matkul Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<List<BukuAjarModel>> getAllBukuAjar(int page) async {
    getToken();

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/buku_ajar/daftar?page=$page&limit=50&sort_by=DESC';

    var header = {"Authorization": "bearer${token}"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['data'] != null) {
        print("data buku tidak null");
        final books = <BukuAjarModel>[];
        json['data'].forEach((v) {
          books.add(BukuAjarModel.fromJson(v));
        });

        // Testing
        for (int i = 0; i < books.length; i++) {
          print(i.toString() + ' ' + books[i].judul_buku.toString());
        }

        return books;
      } else {
        print("Data buku ajar Null");
        return [];
      }
    } else {
      throw ('Gagal terkoneksi');
    }
  }

  static Future<List<PenelitianModel>> getAllPenelitian(int page) async {
    getToken();

    var url =
        'http://onedata.unila.ac.id/api/live/0.1/penelitian/daftar?page=$page&limit=100&sort_by=DESC';

    var header = {"Authorization": "bearer${token}"};

    final response = await http.get(
      headers: header,
      Uri.parse(url),
    );

    print(response.statusCode.toString());

    if (response.statusCode == 202) {
      print("berhasil koneksi");
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['response']['data'] != null) {
        print("data penelitian tidak null");
        print(json['response']['data'].length);
        final penelitians = <PenelitianModel>[];
        json['response']['data'].forEach((v) {
          penelitians.add(PenelitianModel.fromJson(v));
        });

        // Testing
        for (int i = 0; i < penelitians.length; i++) {
          print(
              i.toString() + ' ' + penelitians[i].judul_penelitian.toString());
        }

        return penelitians;
      } else {
        print("Data buku ajar Null");
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
