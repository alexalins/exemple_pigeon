package com.example.exemple_pigeon

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.Pigeon
import io.flutter.plugins.Pigeon.*
import java.util.*


class MainActivity: FlutterActivity() {

    private class MyBookApi: Pigeon.BookApi {
        override fun search(keyword: String): MutableList<Book> {
            val random = Random()
            val book = Pigeon.Book()
            book.image = "https://source.unsplash.com/random/?book?sig=" + random.nextInt()
            book.title = "Life " + keyword

            return Collections.singletonList(book)
        }

    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Pigeon.BookApi.setup(flutterEngine.dartExecutor.binaryMessenger, MyBookApi())
    }
}
