import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'dart:math';

import 'package:iaunila/screens/detail_alumni_screen.dart';

class AlumniList extends StatefulWidget {
  final List<AlumniModel> alumnis;
  AlumniList({Key? key, required this.alumnis}) : super(key: key);

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  late List<AlumniModel> alumniList;
  String query = '';

  @override
  void initState() {
    super.initState();
    alumniList = widget.alumnis;
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
              itemCount: alumniList.length,
              itemBuilder: (context, index) {
                final alumni = alumniList[index];
                return listItem(alumni);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(AlumniModel alumni) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return DetailAlumniScreen(
              alumni: alumni,
            );
          }),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: ListTile(
          leading: Image.asset('assets/logo/alumni.png'),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              alumni.nama_alumni.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          subtitle: Text("NPM ${alumni.npm.toString()}"
              "\nIPK : ${alumni.ipk.toString()}"
              "\nLama Studi : "
              "${((alumni.lama_study! / 12) * pow(10.0, 2)).round().toDouble() / (pow(10.0, 2))} "
              "Tahun"),
          contentPadding: const EdgeInsets.all(20),
        ),
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
        hintText: 'Cari Berdasarkan NPM atau Nama',
        onChanged: searchAlumni,
      ),
    );
  }

  void searchAlumni(String query) {
    final newAlumniList = widget.alumnis.where((alumni) {
      final namaLower = alumni.nama_alumni.toString().toLowerCase();
      final npm = alumni.npm.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower) || npm.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.alumniList = newAlumniList;
    });
  }
}
