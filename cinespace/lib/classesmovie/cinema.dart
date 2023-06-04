import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class CinemaMovie extends StatelessWidget {
  final List cinema;

  const CinemaMovie({Key? key, required this.cinema}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filmes atualmente nos cinemas',
              style: GoogleFonts.breeSerif(fontSize: 25)),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: cinema.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onDoubleTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 130,
                    child: Column(
                      children: [
                        Container(
                            child: ClipRRect(
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: 'https://image.tmdb.org/t/p/w500' +
                                  cinema[index]['poster_path']),
                          borderRadius: BorderRadius.circular(10),
                        )),
                        Container(
                          child: Text(cinema[index]['title'] != null
                              ? cinema[index]['title']
                              : 'carregando...'),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
