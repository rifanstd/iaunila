import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';

class DetailAlumniScreen extends StatefulWidget {
  final AlumniModel alumni;
  const DetailAlumniScreen({Key? key, required this.alumni}) : super(key: key);

  @override
  State<DetailAlumniScreen> createState() => _DetailAlumniScreenState();
}

class _DetailAlumniScreenState extends State<DetailAlumniScreen> {
  String? jk;

  @override
  void initState() {
    super.initState();

    if(widget.alumni.jenis_kelamin == 'L') {
      jk = 'Laki-laki';
    } else if (widget.alumni.jenis_kelamin == 'P') {
      jk = 'Perempuan';
    } else {
      jk = 'Tidak diketahui';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Alumni",
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
                      'assets/logo/detail_mahasiswa.png',
                      width: 150,
                    ),
                  ),
                ),
                Text(
                  widget.alumni.nama_alumni.toString(),
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
                  "NPM",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.alumni.npm.toString(),
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
                  "IPK",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.alumni.ipk.toString(),
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
                  "Angkatan",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.alumni.angkatan.toString(),
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
                  "Agama",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.alumni.agama.toString(),
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
                  "Jenis Kelamin",
                  textAlign: TextAlign.start,
                ),
                Text(
                  jk!.toString(),
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
                  "Lama Studi",
                  textAlign: TextAlign.start,
                ),
                Text(
                  "${widget.alumni.lama_study!/12} Tahun",
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
                  "Tanggal Wisuda",
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.alumni.tanggal_wisuda.toString(),
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
