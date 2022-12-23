import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class PilihProdiScreen extends StatefulWidget {
  const PilihProdiScreen({Key? key}) : super(key: key);

  @override
  State<PilihProdiScreen> createState() => _PilihProdiScreenState();
}

class _PilihProdiScreenState extends State<PilihProdiScreen> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<ProdiModel>>(
            future: IaunilaService.getAllProdi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PilihProdiList(prodis: snapshot.data ?? []);
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
