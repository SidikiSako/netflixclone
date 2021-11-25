import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    await dataProvider.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Container(
            color: Colors.red,
            height: 500,
            child: dataProvider.popularMovies.isEmpty
                ? const Center()
                : Image.network(
                    dataProvider.popularMovies[0].posterURL(),
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
                  child: dataProvider.popularMovies.isEmpty
                      ? Center(
                          child: Text(index.toString()),
                        )
                      : Image.network(
                          dataProvider.popularMovies[index].posterURL(),
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
