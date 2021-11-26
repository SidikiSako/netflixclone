import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/person.dart';

class CastingCard extends StatelessWidget {
  final Person person;
  const CastingCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              width: 160,
              imageUrl: person.imageURL!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: SizedBox(
              width: 150,
              child: Text(
                person.name,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 150,
              child: Text(
                person.characterName,
                //overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
