import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'components.dart';

class FakultasList extends StatefulWidget {
  final List<FakultasModel> faculties;
  FakultasList({Key? key, required this.faculties}) : super(key: key);

  @override
  State<FakultasList> createState() => _FakultasListState();
}

class _FakultasListState extends State<FakultasList> {
  late List<FakultasModel> fakultasList;
  String query = '';

  @override
  void initState() {
    super.initState();
    fakultasList = widget.faculties;
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
              itemCount: fakultasList.length,
              itemBuilder: (context, index) {
                final fakultas = fakultasList[index];
                return listItem(fakultas);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(FakultasModel fakultas) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        leading: Image.asset('assets/logo/fakultas.png'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            fakultas.nm_lemb.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        subtitle: Text(
            "Jenis : ${fakultas.nm_jns_sms.toString()}"),
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
        hintText: 'Pencarian Berdasarkan Nama Fakultas',
        onChanged: searchProdi,
      ),
    );
  }

  void searchProdi(String query) {
    final newFakultasList = widget.faculties.where((fakultas) {
      final namaLower = fakultas.nm_lemb.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.fakultasList = newFakultasList;
    });
  }
}
