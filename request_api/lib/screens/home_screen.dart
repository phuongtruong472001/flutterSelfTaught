import 'package:flutter/material.dart';
import 'package:request_api/widgets/home/popular_film_widget.dart';
import 'package:request_api/widgets/tv_show_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 20,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Top 10 TV Shows",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          TVShowWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 20,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Most popular TV Shows",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          PopularFilmWidget()
        ],
      ),
    );
  }
}
