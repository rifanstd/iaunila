import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';

class PenelitianList extends StatefulWidget {
  final List<PenelitianModel> penelitians;
  PenelitianList({Key? key, required this.penelitians}) : super(key: key);

  @override
  State<PenelitianList> createState() => _PenelitianListState();
}

class _PenelitianListState extends State<PenelitianList> {
  late List<PenelitianModel> penelitianList;
  String query = '';

  @override
  void initState() {
    super.initState();
    penelitianList = widget.penelitians;
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
              itemCount: penelitianList.length,
              itemBuilder: (context, index) {
                final penelitian = penelitianList[index];
                return listItem(penelitian);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(PenelitianModel penelitian) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        leading: Image.asset('assets/logo/penelitian.png'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            penelitian.judul_penelitian.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        subtitle: Text("Bidang Keilmuan : ${penelitian.bidang_keilmuan.toString()}\n"
            "Tahun Pelaksanaan : ${penelitian.tahun_pelaksanaan.toString()}"),
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
        hintText: 'Cari Berdasarkan Nama atau Bidang Keilmuan',
        onChanged: searchPenelitian,
      ),
    );
  }

  void searchPenelitian(String query) {
    final newPenelitianList = widget.penelitians.where((penelitian) {
      final judulLower = penelitian.judul_penelitian.toString().toLowerCase();
      final bidangLower = penelitian.bidang_keilmuan.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return judulLower.contains(searchLower) || bidangLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.penelitianList = newPenelitianList;
    });
  }
}
