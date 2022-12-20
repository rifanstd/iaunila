import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class PenelitianScreen extends StatefulWidget {
  const PenelitianScreen({Key? key}) : super(key: key);

  @override
  State<PenelitianScreen> createState() => _PenelitianScreenState();
}

class _PenelitianScreenState extends State<PenelitianScreen> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("Penelitian", style: TextStyle(color: Colors.black),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
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
                    if (page == 20) {
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
          FutureBuilder<List<PenelitianModel>>(
            future: IaunilaService.getAllPenelitian(page),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("Berhasil");
                return PenelitianList(penelitians: snapshot.data ?? []);
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
