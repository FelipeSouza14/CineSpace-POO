import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cinespace/pages/descricao.dart';

class PopularMovie extends StatelessWidget {
  final List popular;

  const PopularMovie({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filmes mais populares',
              style: GoogleFonts.breeSerif(fontSize: 25)),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: popular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionMovie(
                          name: popular[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+popular[index]['backdrop_path'],
                          descricao: popular[index]['overview'],
                          votos: popular[index]['vote_average'].toString(),
                          date: popular[index]['release_date'],
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
                              image: 'https://image.tmdb.org/t/p/w500' +
                                  popular[index]['poster_path']),
                          borderRadius: BorderRadius.circular(10),
                        )),
                        Container(
                          child: Text(popular[index]['title'] != null
                              ? popular[index]['title']
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
