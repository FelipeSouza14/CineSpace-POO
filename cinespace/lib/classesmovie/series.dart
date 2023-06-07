import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cinespace/pages/descricao.dart';

class BestSeries extends StatelessWidget {
  final List tvbest;

  const BestSeries({Key? key, required this.tvbest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Melhores séries para assistir',
              style: GoogleFonts.breeSerif(fontSize: 25)),
          Container(
            height: 260,
            child: ListView.builder(
              itemCount: tvbest.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionMovie(
                          name: tvbest[index]['name'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+tvbest[index]['backdrop_path'],
                          descricao: tvbest[index]['overview'],
                          votos: tvbest[index]['vote_average'].toString(),
                          date: tvbest[index]['first_air_date'],
                          poster: 'https://image.tmdb.org/t/p/w500'+tvbest[index]['poster_path'],
                        )
                      )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 130,
                    child: Column(
                      children: [
                        Container(
                            child: ClipRRect(
                              child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: 'https://image.tmdb.org/t/p/w500'+tvbest[index]['poster_path']),
                            borderRadius: BorderRadius.circular(10),
                        )),
                        Container(
                          child: Text(tvbest[index]['name'] != null
                              ? tvbest[index]['name']
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
