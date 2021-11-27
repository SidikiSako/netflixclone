import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/widgets/my_video_player.dart';

class MovieVideoList extends StatelessWidget {
  final Movie movie;
  const MovieVideoList({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movie.videos!.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Autres videos',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: movie.videos!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        //color: Colors.red,
                        margin: const EdgeInsets.only(right: 20),
                        // width: MediaQuery.of(context).size.width,
                        // height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250,
                              child: MyVideoPlayer(
                                movieId: movie.videos![index].key,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              movie.videos![index].name,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
