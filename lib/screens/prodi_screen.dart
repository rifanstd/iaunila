import 'package:flutter/material.dart';
import 'package:iaunila/components/prodi_list.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/api/iaunila_service.dart';

class ProdiScreen extends StatefulWidget {
  const ProdiScreen({Key? key}) : super(key: key);

  @override
  State<ProdiScreen> createState() => _ProdiScreenState();
}

class _ProdiScreenState extends State<ProdiScreen> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("Program Studi", style: TextStyle(color: Colors.black),),
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
          FutureBuilder<List<ProdiModel>>(
            future: IaunilaService.getAllProdi(page),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ProdiList(prodis: snapshot.data ?? []);
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
