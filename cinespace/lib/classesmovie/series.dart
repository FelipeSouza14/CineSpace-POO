import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class BestSeries extends StatelessWidget {
  final List tvbest;

  const BestSeries({Key? key, required this.tvbest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Melhores séries para assistir',
              style: GoogleFonts.breeSerif(fontSize: 25)),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: tvbest.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onDoubleTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                            child: ClipRRect(
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: 'https://image.tmdb.org/t/p/w500' +
                                  tvbest[index]['poster_path']),
                          borderRadius: BorderRadius.circular(10),
                        )),
                        Container(
                          child: Text(tvbest[index]['title'] != null
                              ? tvbest[index]['title']
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
