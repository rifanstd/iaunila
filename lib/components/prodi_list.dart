import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'components.dart';

class ProdiList extends StatefulWidget {
  final List<ProdiModel> prodis;
  ProdiList({Key? key, required this.prodis}) : super(key: key);

  @override
  State<ProdiList> createState() => _ProdiListState();
}

class _ProdiListState extends State<ProdiList> {
  late List<ProdiModel> prodiList;
  String query = '';

  @override
  void initState() {
    super.initState();
    prodiList = widget.prodis;
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
              itemCount: prodiList.length,
              itemBuilder: (context, index) {
                final prodi = prodiList[index];
                return listItem(prodi);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(ProdiModel prodi) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        leading: Image.asset('assets/mahasiswa_icon/mahasiswa.png'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            prodi.nama_prodi.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        subtitle: Text(
            "Akreditasi : ${prodi.nama_akreditasi.toString()}"),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget buildSearch() {
    return Material(
      elevation: 4,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: MahasiswaSearchWidget(
        query: query,
        hintText: 'Cari Berdasarkan Nama Program Studi',
        onChanged: searchMahasiswa,
      ),
    );
  }

  void searchMahasiswa(String query) {
    final newProdiList = widget.prodis.where((prodi) {
      final namaLower = prodi.nama_prodi.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.prodiList = newProdiList;
    });
  }
}
