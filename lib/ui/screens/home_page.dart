import 'package:flutter/material.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/ui/widgets/movie_card.dart';
import 'package:netflix_clone/ui/widgets/movie_category.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: MovieCard(
              movie: dataProvider.popularMovies.first,
            ),
          ),
          MovieCategory(
            imageHeight: 160,
            imageWidth: 110,
            label: 'Tendances actuelles',
            movieList: dataProvider.popularMovies,
            callback: dataProvider.getPopularMovies,
          ),
          // MovieCategory(
          //   imageHeight: 320,
          //   imageWidth: 220,
          //   label: 'Les séries qui cartonnent',
          //   movieList: dataProvider.popularMovies,
          // ),
          // MovieCategory(
          //   imageHeight: 160,
          //   imageWidth: 110,
          //   label: 'Actuellement au cinéma',
          //   movieList: dataProvider.popularMovies,
          // ),
        ],
      ),
    );
  }
}
