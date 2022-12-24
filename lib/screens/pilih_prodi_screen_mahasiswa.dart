import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class PilihProdiScreenMahasiswa extends StatefulWidget {
  final String title;
  const PilihProdiScreenMahasiswa({Key? key, required this.title}) : super(key: key);

  @override
  State<PilihProdiScreenMahasiswa> createState() => _PilihProdiScreenMahasiswaState();
}

class _PilihProdiScreenMahasiswaState extends State<PilihProdiScreenMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString(), style: TextStyle(color: Colors.white),),
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
                return PilihProdiListMahasiswa(prodis: snapshot.data ?? []);
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
