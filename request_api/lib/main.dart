import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_api/models/all_film.dart';
import 'package:request_api/models/detail.dart';
import 'package:request_api/models/film.dart';
import 'package:request_api/models/tv_show.dart';
import 'package:request_api/screens/home_screen.dart';
import 'package:request_api/screens/search_film_screen.dart';
import 'package:request_api/widgets/home/search_widget.dart';

void main() {
  runApp(MyAp());
}

class MyAp extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyAp> {
  List<Film> searchFilms = [];
  String query = "";
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final searchFilms = await AllFilm.fetchAllFilm(query);

    setState(() => this.searchFilms = searchFilms);
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TVShow(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => DetailFilm(),
          // )
        ],
        child: MaterialApp(
            title: 'Request API',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: Scaffold(
                body: SingleChildScrollView(
                    child: Column(children: <Widget>[
              SearchWidget(
                  text: query, onChanged: searchFilm, hintText: "Search"),
              Container(
                child: query.isEmpty ? HomeScreen() : SearchFilm(searchFilms),
              )
            ])))));
  }

  Future searchFilm(String query) async => debounce(() async {
        final searchFilms = await AllFilm.fetchAllFilm(query);
        if (!mounted) return;
        setState(() {
          this.query = query;
          this.searchFilms = searchFilms;
        });
      });
}
