import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/screens/alumni_screen.dart';
import 'package:iaunila/screens/mahasiswa_screen.dart';
import 'components.dart';

class PilihTahunListAlumni extends StatefulWidget {
  final String idProdi;
  const PilihTahunListAlumni({Key? key, required this.idProdi})
      : super(key: key);

  @override
  State<PilihTahunListAlumni> createState() => _PilihTahunListAlumniState();
}

class _PilihTahunListAlumniState extends State<PilihTahunListAlumni> {
  final List<String> tahunList = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumni", style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 20),
              child: Text(
                "Pilih Tahun Lulusan",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tahunList.length,
                itemBuilder: (context, index) {
                  final tahun = tahunList[index];
                  return listItem(tahun);
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
    );
  }

  Widget listItem(String _tahun) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return AlumniScreen(idProdi: widget.idProdi, tahun: _tahun);
        }));
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
              _tahun,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          trailing: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
