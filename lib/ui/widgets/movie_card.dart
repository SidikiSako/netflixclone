import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/screens/movie_details_page.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return MovieDetailsPage(
                movie: widget.movie,
              );
            },
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: widget.movie.posterURL(),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
