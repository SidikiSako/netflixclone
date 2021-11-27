import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/ui/widgets/action_button.dart';
import 'package:netflix_clone/ui/widgets/casting_card.dart';
import 'package:netflix_clone/ui/widgets/movie_card.dart';
import 'package:netflix_clone/ui/widgets/movie_info.dart';
import 'package:netflix_clone/ui/widgets/movie_video_list.dart';
import 'package:netflix_clone/ui/widgets/my_video_player.dart';
import 'package:netflix_clone/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? _movie;
  YoutubePlayerController? _controller;
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
    initVideoPlayer();
  }

  void initVideoPlayer() {
    //print("VIDEO ID = ${_movie!.videos!.first.key}");
    //todo : afficher no vidéo si la vidéo n'a pas de vidéo
    if (_movie!.videos!.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: _movie!.videos!.first.key,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          hideThumbnail: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
                SizedBox(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: _movie!.videos!.isEmpty
                        ? Center(
                            child: Text(
                              'Pas de vidéo',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : MyVideoPlayer(movieId: _movie!.videos!.first.key)),
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
                        const SizedBox(height: 20),
                        Text(
                          'Casting',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _movie!.cast!.length,
                              itemBuilder: (context, index) {
                                return _movie!.cast![index].imageURL == null
                                    ? const Center()
                                    : CastingCard(person: _movie!.cast![index]);
                              }),
                        ),

                        MovieVideoList(movie: _movie!),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
