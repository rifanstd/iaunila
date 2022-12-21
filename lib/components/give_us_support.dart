import 'package:flutter/material.dart';

class GiveUsSupport extends StatelessWidget {
  const GiveUsSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "Give Us Support",
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
          "Aplikasi Informasi Akademik Universitas Lampung (IAUNILA) masih dalam proses pengembangan. Masih terdapat banyak kekurangan pada aplikasi ini. Berikan kritik dan saran Anda demi perbaikan dan penyempurnaan aplikasi IAUNILA.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
