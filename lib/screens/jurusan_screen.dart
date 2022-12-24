import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/api/iaunila_service.dart';

class JurusanScreen extends StatefulWidget {
  const JurusanScreen({Key? key}) : super(key: key);

  @override
  State<JurusanScreen> createState() => _JurusanScreenState();
}

class _JurusanScreenState extends State<JurusanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jurusan", style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(5.0), //<-- SEE HERE
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<JurusanModel>>(
            future: IaunilaService.getAllJurusan(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return JurusanList(jurusans: snapshot.data ?? []);
              } else {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const CircularProgressIndicator(),
                  ),
              );
              }
            },
          )
        ],
      ),
    );
  }
}
