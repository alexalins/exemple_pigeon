import 'package:exemple_pigeon/pigeon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Book> _books = [];

  Future _getBook() async {
    final number = this._books.length + 1;
    final List<Book?> books = await BookApi().search("Book $number");
    final newBooks = List<Book>.from(books);
    //
    setState(() {
      this._books..addAll(newBooks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemple Pigeon"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
            child: Text("Fecth Book"),
            onPressed: _getBook,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            )),
      ),
    );
  }
}
