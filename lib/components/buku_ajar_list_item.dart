import 'package:flutter/material.dart';
import 'package:iaunila/database/db_helper.dart';
import 'package:iaunila/models/buku_ajar_model.dart';

class BukuAjarListItem extends StatefulWidget {
  final BukuAjarModel book;
  BukuAjarListItem({Key? key, required this.book}) : super(key: key);

  @override
  State<BukuAjarListItem> createState() => _BukuAjarListItemState();
}

class _BukuAjarListItemState extends State<BukuAjarListItem> {
  DBHelper dbHelper = DBHelper();
  bool _isFavorited = false;

  @override
  void initState() {
    _getBukuAjar(widget.book.id_buku_ajar.toString());
    super.initState();
  }

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
        trailing: IconButton(
          icon: (_isFavorited
              ? const Icon(
                  Icons.bookmark_added_sharp,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.bookmark_add,
                  color: Colors.grey,
                )),
          onPressed: () async {
            if (dbHelper == await null) {
              print("DBHelper NULL");
            } else {
              if (_isFavorited) {
                dbHelper.deleteBukuAjar(widget.book.id_buku_ajar.toString());
                setState(() {
                  _isFavorited = !_isFavorited;
                });

                final snackBar = SnackBar(
                  content: Text(
                      "${widget.book.judul_buku} dihapus dari daftar baca."),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                dbHelper.addBukuAjar(widget.book);
                setState(() {
                  _isFavorited = !_isFavorited;
                });
                final snackBar = SnackBar(
                  content: Text("${widget.book.judul_buku} ditambahkan ke daftar baca."),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _getBukuAjar(String id) async {
    var _book = await dbHelper.getBukuAjar(id);
    setState(() {
      if (_book?.id_buku_ajar.toString() == widget.book.id_buku_ajar) {
        _isFavorited = true;
      } else {
        _isFavorited = false;
      }
    });
  }
}
