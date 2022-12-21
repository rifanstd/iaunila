import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/database/db_helper.dart';

class DaftarBacaScreen extends StatefulWidget {
  const DaftarBacaScreen({Key? key}) : super(key: key);

  @override
  State<DaftarBacaScreen> createState() => _DaftarBacaScreenState();
}

class _DaftarBacaScreenState extends State<DaftarBacaScreen> {
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BukuAjarModel>>(
      future: dbHelper.getAllBukuAjar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DaftarBacaList(books: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
