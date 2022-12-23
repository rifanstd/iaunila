import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iaunila/models/mahasiswa_model.dart';

class DetailMahasiswaScreen extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  const DetailMahasiswaScreen({Key? key, required this.mahasiswa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Mahasiswa",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo/detail_mahasiswa.png",
                      width: 200,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      mahasiswa.nama_mahasiswa.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemDetail(context, mahasiswa.npm.toString(), 'NPM',
                            const Color.fromRGBO(252, 194, 3, 1)),
                        ItemDetail(
                            context,
                            mahasiswa.program_studi.toString(),
                            'Program Studi',
                            const Color.fromRGBO(83, 219, 24, 1)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemDetail(context, mahasiswa.ips.toString(), 'IPS',
                            const Color.fromRGBO(255, 100, 33, 1)),
                        ItemDetail(
                            context,
                            mahasiswa.ipk.toString(),
                            'IPK',
                            const Color.fromRGBO(63, 209, 187, 1)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemDetail(context, mahasiswa.total_sks.toString(), 'SKS Lulus',
                            const Color.fromRGBO(73, 183, 235, 1)),
                        ItemDetail(
                            context,
                            mahasiswa.status.toString(),
                            'Status',
                            const Color.fromRGBO(181, 75, 242, 1)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemDetail(context, mahasiswa.semester_sekarang.toString(), 'Semester',
                            const Color.fromRGBO(123, 228, 232, 1)),
                        ItemDetail(
                            context,
                            mahasiswa.periode_masuk.toString(),
                            'Periode Masuk',
                            const Color.fromRGBO(247, 119, 27, 1)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ItemDetail(
      BuildContext context, String value, String title, Color _color) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 4,
      color: _color,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: 170,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
