import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iaunila/components/components.dart';
import 'package:iaunila/database/db_helper.dart';
import 'package:iaunila/models/models.dart';

class BukuAjarList extends StatefulWidget {
  final List<BukuAjarModel> books;
  BukuAjarList({Key? key, required this.books}) : super(key: key);

  @override
  State<BukuAjarList> createState() => _BukuAjarListState();
}

class _BukuAjarListState extends State<BukuAjarList> {
  late List<BukuAjarModel> bookList;

  String query = '';

  @override
  void initState() {
    super.initState();
    bookList = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildSearch(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                final book = bookList[index];
                return BukuAjarListItem(book: book);
              },
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Material(
      elevation: 4,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
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
