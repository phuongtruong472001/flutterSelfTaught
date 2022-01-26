import 'package:flutter/material.dart';

import 'package:request_api/models/detail.dart';
import 'package:request_api/models/film.dart';

class DetailScreen extends StatefulWidget {
  int id;
  DetailScreen({Key? key, required this.id}) : super(key: key);
  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  late Future<Detail> futureFilm;
  @override
  void initState() {
    super.initState();
    futureFilm = fetchDetailFilm(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Detail>(
          future: futureFilm,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          snapshot.data!.image,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.black),
                    height: 500,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 20),
                            )),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                              snapshot.data!.network +
                                  " | " +
                                  snapshot.data!.startDate,
                              style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            snapshot.data!.description,
                            style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          }),
    );
  }
}
