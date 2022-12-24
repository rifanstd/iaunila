import 'package:flutter/material.dart';
import 'package:iaunila/api/iaunila_service.dart';
import 'package:iaunila/models/models.dart';

class DetailProdiScreen extends StatefulWidget {
  final String nm_lemb;
  const DetailProdiScreen({Key? key, required this.nm_lemb}) : super(key: key);

  @override
  State<DetailProdiScreen> createState() => _DetailProdiScreenState();
}

class _DetailProdiScreenState extends State<DetailProdiScreen> {
  DetailProdiModel? prodi;

  @override
  void initState() {
    IaunilaService.getDetailProdi(widget.nm_lemb).then((value) {
      setState(() {
        prodi = value.first;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Program Studi",
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
        child: (prodi == null
            ? const Center(heightFactor: 20, child: CircularProgressIndicator())
            : Card(
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
                        prodi!.nama_lembaga.toString(),
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
                        prodi!.stat_prodi.toString(),
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
                        "Kode Prodi",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        prodi!.kode_prodi.toString(),
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
                        "SKS Lulus",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        prodi!.sks_lulus.toString(),
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
                        "Gelar Lulusan",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        prodi!.gelar_lulusan.toString(),
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
                        "Jenjang Pendidikan",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        prodi!.nm_jenj_didik.toString(),
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
                        "Email",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        prodi!.email.toString(),
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
              )),
      ),
    );
  }
}
