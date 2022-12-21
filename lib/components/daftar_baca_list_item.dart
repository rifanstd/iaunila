import 'package:flutter/material.dart';
import 'package:iaunila/models/buku_ajar_model.dart';
import 'package:iaunila/database/db_helper.dart';

class DaftarBacaListItem extends StatefulWidget {
  final BukuAjarModel book;
  DaftarBacaListItem({Key? key, required this.book}) : super(key: key);

  @override
  State<DaftarBacaListItem> createState() => _DaftarBacaListItemState();
}

class _DaftarBacaListItemState extends State<DaftarBacaListItem> {
  DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: ListTile(
        leading: Image.asset('assets/logo/buku_ajar.png'),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.book.judul_buku.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        subtitle: Text("Penerbit : ${widget.book.penerbit.toString()}\n"
            "Tanggal Terbit : ${widget.book.tanggal_terbit.toString()}"),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
