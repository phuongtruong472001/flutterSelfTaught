import 'package:flutter/material.dart';
import 'package:request_api/models/film.dart';
import 'package:request_api/screens/detail_screen.dart';

class SearchFilm extends StatelessWidget {
  List<Film> films;

  SearchFilm(this.films, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(films);
    return Container(
      height: 700,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            id: films[index].id,
                          )));
            },
            child: Image.network(films[index].image),
          );
        },
      ),
    );
  }
}
