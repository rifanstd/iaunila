import 'package:flutter/material.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Informasi Akademik Universitas Lampung (IAUNILA) adalah aplikasi yang memberikan informasi terkait Akademik Universitas Lampung."
              "Informasi yang ditampilkan pada aplikasi ini berupa informasi Mahasiswa, Program Studi, Jurusan, Fakultas, Alumni, Mata Kuliah, Buku Ajar serta Penelitian.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
