import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';

class DetailMatkulScreen extends StatefulWidget {
  final MataKuliahModel matkul;
  const DetailMatkulScreen({Key? key, required this.matkul}) : super(key: key);

  @override
  State<DetailMatkulScreen> createState() => _DetailMatkulScreenState();
}

class _DetailMatkulScreenState extends State<DetailMatkulScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Mata Kuliah",
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blueAccent,
          ), //<-- SEE HERE
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
                      'assets/logo/detail_matkul.png',
                      width: 150,
                    ),
                  ),
                ),
                Text(
                    (widget.matkul.nm_mk != null ? widget.matkul.nm_mk.toString() : '-'),
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
                  "Program Studi",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.matkul.nm_prodi.toString(),
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
                  "Kode Mata Kuliah",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.matkul.kode_mk.toString(),
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
                  "Bobot SKS",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.matkul.sks_mk.toString(),
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
                  "Status",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.matkul.status.toString(),
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
                  "Semester",
                  textAlign: TextAlign.start,
                ),
                Text(
                    (widget.matkul.semester != null ? widget.matkul.semester.toString() : '-'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
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
