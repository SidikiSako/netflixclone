import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/ui/widgets/action_button.dart';
import 'package:netflix_clone/ui/widgets/movie_info.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? _movie;
  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    Movie newMovie = await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      _movie = newMovie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: _movie == null
          ? const Center(
              child: SpinKitFadingCircle(
                color: kPrimaryColor,
                size: 20,
              ),
            )
          : Column(
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        MovieInfo(movie: _movie!),
                        const SizedBox(height: 10),
                        const ActionButton(
                          bgColor: Colors.white,
                          color: kBackgroundColor,
                          icon: Icons.play_arrow,
                          label: 'Lecture',
                        ),
                        const SizedBox(height: 10),
                        ActionButton(
                          bgColor: Colors.grey.withOpacity(0.3),
                          color: Colors.white,
                          icon: Icons.download,
                          label: 'Télécharger la vidéo',
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _movie!.description,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
