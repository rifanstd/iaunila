import 'package:flutter/material.dart';
import 'package:iaunila/api/iaunila_service.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';

class LulusanTerbaik extends StatefulWidget {

  const LulusanTerbaik({Key? key}) : super(key: key);

  @override
  State<LulusanTerbaik> createState() => _LulusanTerbaikState();
}

class _LulusanTerbaikState extends State<LulusanTerbaik> {
  List<AlumniModel> lulusanTerbaik = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AlumniModel>>(
      future: IaunilaService.getLulusanTerbaik(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LulusanTerbaikList(lulusans: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
