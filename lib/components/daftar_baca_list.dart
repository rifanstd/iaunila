import 'package:flutter/material.dart';
import 'package:iaunila/components/daftar_baca_list_item.dart';
import 'package:iaunila/models/models.dart';
import 'package:iaunila/database/db_helper.dart';
import 'components.dart';

class DaftarBacaList extends StatefulWidget {
  final List<BukuAjarModel> books;
  DaftarBacaList({Key? key, required this.books}) : super(key: key);

  @override
  State<DaftarBacaList> createState() => _DaftarBacaListState();
}

class _DaftarBacaListState extends State<DaftarBacaList> {
  late List<BukuAjarModel> bookList;
  DBHelper dbHelper = DBHelper();

  String query = '';

  @override
  void initState() {
    super.initState();
    bookList = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Daftar Baca',
            style: TextStyle(color: Colors.black),
          ),
          foregroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildSearch(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 10,
            ),
            (bookList.length == 0
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text("Belum ada buku ajar yang ditambahkan"),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: bookList.length,
                      itemBuilder: (context, index) {
                        final book = bookList[index];
                        return DaftarBacaListItem(book: book);
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  )),
          ],
        ));
  }

  Widget buildSearch() {
    return Material(
      elevation: 4,
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: LiveSearchWidget(
        query: query,
        hintText: 'Cari Berdasarkan Nama atau Penerbit',
        onChanged: searchBook,
      ),
    );
  }

  void searchBook(String query) {
    final newBookList = widget.books.where((book) {
      final judulLower = book.judul_buku.toString().toLowerCase();
      final penerbit = book.penerbit.toString().toLowerCase();
      final searchLower = query.toString().toLowerCase();

      return judulLower.contains(searchLower) || penerbit.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.bookList = newBookList;
    });
  }
}
