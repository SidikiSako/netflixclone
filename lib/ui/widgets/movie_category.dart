import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';

import 'movie_card.dart';

class MovieCategory extends StatelessWidget {
  final String label;
  final List<Movie> movieList;
  final double imageHeight;
  final double imageWidth;
  final Function callback;
  const MovieCategory({
    Key? key,
    required this.imageHeight,
    required this.imageWidth,
    required this.label,
    required this.movieList,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: imageHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final currentPosition = notification.metrics.pixels;
              print("CURRENTPOSITION = $currentPosition");
              final max = notification.metrics.maxScrollExtent;
              print("MAXEXTENT = $max");
              if (currentPosition >= max / 2) {
                print('FETCHING NEW DATA');
                callback();
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: imageWidth,
                  child: MovieCard(
                    movie: movieList[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
