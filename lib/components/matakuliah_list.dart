import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/screens/screens.dart';

class MataKuliahList extends StatefulWidget {
  final List<MataKuliahModel> matkuls;
  MataKuliahList({Key? key, required this.matkuls}) : super(key: key);

  @override
  State<MataKuliahList> createState() => _MataKuliahListState();
}

class _MataKuliahListState extends State<MataKuliahList> {
  late List<MataKuliahModel> mataKuliahList;
  String query = '';

  @override
  void initState() {
    super.initState();
    mataKuliahList = widget.matkuls;
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
              itemCount: mataKuliahList.length,
              itemBuilder: (context, index) {
                final matkul = mataKuliahList[index];
                return listItem(matkul);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(MataKuliahModel matkul) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailMatkulScreen(matkul: matkul);
            }
          )
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: ListTile(
          leading: Image.asset('assets/logo/mata_kuliah.png'),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              matkul.nm_mk.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          subtitle: Text("Status : ${matkul.status.toString()}"
              "\nSKS : ${matkul.sks_mk.toString()}"
              "\nKode Mata Kuliah : "
              "${matkul.kode_mk.toString()}"),
          contentPadding: const EdgeInsets.all(20),
          trailing: const Icon(Icons.navigate_next),
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
        hintText: 'Cari Berdasarkan Nama atau Kode Matkul',
        onChanged: searchMatkul,
      ),
    );
  }

  void searchMatkul(String query) {
    final newMatkulList = widget.matkuls.where((matkul) {
      final namaLower = matkul.nm_mk.toString().toLowerCase();
      final kode = matkul.kode_mk.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return namaLower.contains(searchLower) || kode.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.mataKuliahList = newMatkulList;
    });
  }
}
