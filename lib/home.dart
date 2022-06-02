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
        body: Column(children: [
          Expanded(
              child: PageView.builder(
            itemCount: _books.length,
            itemBuilder: (context, index) {
              final book = _books[index];
              return Column(
                children: [
                  Expanded(
                      child: Image.network(book.image!, fit: BoxFit.cover)),
                  const SizedBox(height: 8),
                  Text(book.title!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                ],
              );
            },
          )),
          ElevatedButton(
              child: Text("Fecth Book"),
              onPressed: _getBook,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ))
        ]));
  }
}
