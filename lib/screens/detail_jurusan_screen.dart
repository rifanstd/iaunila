import 'package:flutter/material.dart';
import 'package:iaunila/api/iaunila_service.dart';
import 'package:iaunila/models/models.dart';

class DetailJurusanScreen extends StatefulWidget {
  final JurusanModel jurusan;
  const DetailJurusanScreen({Key? key, required this.jurusan}) : super(key: key);

  @override
  State<DetailJurusanScreen> createState() => _DetailJurusanScreenState();
}

class _DetailJurusanScreenState extends State<DetailJurusanScreen> {
  String? nama_fakultas = '...';

  @override
  void initState() {
    IaunilaService.getNamaFakultasByID(widget.jurusan.id_fak_unila.toString()).then((value) {
      setState(() {
        nama_fakultas = value.nm_lemb.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Jurusan",
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
        ),
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            width: 400,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/logo/detail_prodi.png',
                      width: 150,
                    ),
                  ),
                ),
                Text(
                  (nama_fakultas != null ? widget.jurusan.nm_lemb.toString() : '...'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Status Akreditasi",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.jurusan.stat_prodi.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Fakultas",
                  textAlign: TextAlign.start,
                ),
                Text(
                  nama_fakultas.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 12,
                ),

                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
