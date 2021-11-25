import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie>? movies;
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() {
    APIService().getPopularMovies(page: 1).then((movieList) {
      setState(() {
        movies = movieList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Container(
            color: Colors.red,
            height: 500,
            child: movies == null
                ? const Center()
                : Image.network(
                    movies![0].posterURL(),
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 15),
          Text(
            'Tendances actuelles',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.yellow,
                  ),
                  width: 110,
                  child: movies == null
                      ? Center(
                          child: Text(index.toString()),
                        )
                      : Image.network(
                          movies![index].posterURL(),
                          fit: BoxFit.cover,
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Les séries qui cartonnent',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue,
                  ),
                  width: 160,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Actuellement au cinéma',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.green,
                  ),
                  width: 110,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
