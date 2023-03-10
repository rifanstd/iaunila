import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/screens/detail_mahasiswa_screen.dart';

class MahasiswaList extends StatefulWidget {
  final List<MahasiswaModel> mahasiswas;
  MahasiswaList({Key? key, required this.mahasiswas}) : super(key: key);

  @override
  State<MahasiswaList> createState() => _MahasiswaListState();
}

class _MahasiswaListState extends State<MahasiswaList> {
  late List<MahasiswaModel> mahasiswaList;
  String query = '';

  @override
  void initState() {
    super.initState();
    mahasiswaList = widget.mahasiswas;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildSearch(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaList[index];
                return listItem(mahasiswa);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(MahasiswaModel mahasiswa) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailMahasiswaScreen(mahasiswa: mahasiswa);
            }
          )
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(30.0), //<-- SEE HERE
        ),
        elevation: 2,
        margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
        child: ListTile(
          leading: Image.asset('assets/mahasiswa_icon/mahasiswa.png', width: 40,),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              mahasiswa.nama_mahasiswa.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text("NPM ${mahasiswa.npm.toString()}"),
          contentPadding: const EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 12),
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Material(
      elevation: 2,
      shadowColor: Colors.blueAccent,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: LiveSearchWidget(
        query: query,
        hintText: 'Cari Berdasarkan NPM atau Nama',
        onChanged: searchMahasiswa,
      ),
    );
  }

  void searchMahasiswa(String query) {
    final newMahasiswaList = widget.mahasiswas.where((mahasiswa) {
      final namaLower = mahasiswa.nama_mahasiswa.toString().toLowerCase();
      final npm = mahasiswa.npm.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower) || npm.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      mahasiswaList = newMahasiswaList;
    });
  }
}
