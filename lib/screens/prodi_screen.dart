import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/api/iaunila_service.dart';

class ProdiScreen extends StatefulWidget {
  const ProdiScreen({Key? key}) : super(key: key);

  @override
  State<ProdiScreen> createState() => _ProdiScreenState();
}

class _ProdiScreenState extends State<ProdiScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Program Studi", style: TextStyle(color: Colors.white),),
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
          FutureBuilder<List<ProdiModel>>(
            future: IaunilaService.getAllProdi(),
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
