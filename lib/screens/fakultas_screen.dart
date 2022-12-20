import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/api/iaunila_service.dart';

class FakultasScreen extends StatefulWidget {
  const FakultasScreen({Key? key}) : super(key: key);

  @override
  State<FakultasScreen> createState() => _FakultasScreenState();
}

class _FakultasScreenState extends State<FakultasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Fakultas",
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<FakultasModel>>(
            future: IaunilaService.getAllFakultas(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return FakultasList(faculties: snapshot.data ?? []);
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
