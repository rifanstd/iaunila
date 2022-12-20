import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class MahasiswaScreen extends StatefulWidget {
  const MahasiswaScreen({Key? key}) : super(key: key);

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("Mahasiswa", style: TextStyle(color: Colors.black),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (page == 1) {
                      const snackBar = SnackBar(
                          content:
                          Text("Anda berada pada halaman paling awal"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() {
                        page--;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Back",
                  ),
                ),
                Text("Halaman : $page"),
                ElevatedButton(
                  onPressed: () {
                    if (page == 5) {
                      const snackBar = SnackBar(
                          content:
                          Text("Anda berada pada halaman paling akhir"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() {
                        page++;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    "Next",
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<MahasiswaModel>>(
            future: IaunilaService.getAllMahasiswa(page),
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
