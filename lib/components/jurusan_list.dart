import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'components.dart';

class JurusanList extends StatefulWidget {
  final List<JurusanModel> jurusans;
  JurusanList({Key? key, required this.jurusans}) : super(key: key);

  @override
  State<JurusanList> createState() => _JurusanListState();
}

class _JurusanListState extends State<JurusanList> {
  late List<JurusanModel> jurusanList;
  String query = '';

  @override
  void initState() {
    super.initState();
    jurusanList = widget.jurusans;
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
              itemCount: jurusanList.length,
              itemBuilder: (context, index) {
                final jurusan = jurusanList[index];
                return listItem(jurusan);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(JurusanModel jurusan) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        leading: Image.asset('assets/mahasiswa_icon/mahasiswa.png'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            jurusan.nm_lemb.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        subtitle: Text(
            "Akreditasi : ${jurusan.stat_prodi.toString()}"),
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
      child: LiveSearchWidget(
        query: query,
        hintText: 'Cari Berdasarkan Nama Jurusan',
        onChanged: searchProdi,
      ),
    );
  }

  void searchProdi(String query) {
    final newJurusanList = widget.jurusans.where((jurusan) {
      final namaLower = jurusan.nm_lemb.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.jurusanList = newJurusanList;
    });
  }
}
