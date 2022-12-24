import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';

import '../api/iaunila_service.dart';

class PilihProdiScreenMatkul extends StatefulWidget {
  final String title;
  const PilihProdiScreenMatkul({Key? key, required this.title}) : super(key: key);

  @override
  State<PilihProdiScreenMatkul> createState() => _PilihProdiScreenMatkulState();
}

class _PilihProdiScreenMatkulState extends State<PilihProdiScreenMatkul> {
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
                return PilihProdiListMatkul(prodis: snapshot.data ?? []);
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