import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';


class DescriptionMovie extends StatelessWidget {
  final String name, descricao, votos, bannerurl, date;

  const DescriptionMovie({Key? key, required this.name, required this.descricao, 
  required this.votos, required this.bannerurl, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 550,
                    width: 480,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, 
                      image: bannerurl,
                      ),
                )
              ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                      )
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text('Favorites - '+votos, style: GoogleFonts.breeSerif(fontSize: 25, fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(name!=null?name: 'carregando...', style: GoogleFonts.breeSerif(fontSize: 30)),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(date!=null?date: 'carregando...', style: GoogleFonts.breeSerif(fontSize: 18)),
          )



        ],
      ),





    );
  }
}