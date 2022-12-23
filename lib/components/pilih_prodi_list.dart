import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/screens/mahasiswa_screen.dart';
import 'components.dart';

class PilihProdiList extends StatefulWidget {
  final List<ProdiModel> prodis;
  const PilihProdiList({Key? key, required this.prodis}) : super(key: key);

  @override
  State<PilihProdiList> createState() => _PilihProdiListState();
}

class _PilihProdiListState extends State<PilihProdiList> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 20),
            child: Text(
              "Pilih Prodi",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.blueAccent),
              textAlign: TextAlign.start,
            ),
          ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MahasiswaScreen(idProdi: prodi.id_sms.toString());
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
          leading: Image.asset('assets/logo/prodi.png'),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              prodi.nama_prodi.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          subtitle: Text("Akreditasi : ${prodi.nama_akreditasi.toString()}"),
          contentPadding: const EdgeInsets.all(20),
          trailing: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      shadowColor: Colors.blueAccent,
      child: LiveSearchWidget(
        query: query,
        hintText: 'Cari Berdasarkan Nama Program Studi',
        onChanged: searchProdi,
      ),
    );
  }

  void searchProdi(String query) {
    final newProdiList = widget.prodis.where((prodi) {
      final namaLower = prodi.nama_prodi.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      prodiList = newProdiList;
    });
  }
}
