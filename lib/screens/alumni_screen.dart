import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class AlumniScreen extends StatefulWidget {
  final String idProdi;
  final String tahun;
  const AlumniScreen({Key? key, required this.idProdi, required this.tahun}) : super(key: key);

  @override
  State<AlumniScreen> createState() => _AlumniScreenState();
}

class _AlumniScreenState extends State<AlumniScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumni", style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<AlumniModel>>(
            future: IaunilaService.getAllAlumniByProdi(widget.idProdi, widget.tahun),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AlumniList(alumnis: snapshot.data ?? []);
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
