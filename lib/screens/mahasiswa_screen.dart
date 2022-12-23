import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class MahasiswaScreen extends StatefulWidget {
  final String idProdi;
  const MahasiswaScreen({Key? key, required this.idProdi}) : super(key: key);

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa", style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<MahasiswaModel>>(
            future: IaunilaService.getAllMahasiswa(widget.idProdi),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MahasiswaList(mahasiswas: snapshot.data ?? []);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
