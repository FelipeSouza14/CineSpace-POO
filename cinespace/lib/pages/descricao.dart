import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';


class DescriptionMovie extends StatelessWidget {
  final String name, descricao, votos, bannerurl, date, poster;

  const DescriptionMovie({Key? key, required this.name, required this.descricao, 
  required this.votos, required this.bannerurl, required this.date, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 600,
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
                      colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                      )
                    ),
                  ),
                // Positioned(
                //   left: -2,
                //   child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                //       child: Icon(Icons.arrow_back),

                //     )
                //   ),
                Positioned(
                  bottom: 10,
                  child: Text('Favorites - '+votos, style: GoogleFonts.breeSerif(fontSize: 25, fontWeight: FontWeight.bold),)
                  )
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
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  child: FadeInImage.memoryNetwork(
                    height: 270,
                    width: 150,
                    placeholder: kTransparentImage, 
                    image: poster,),
                    borderRadius: BorderRadius.circular(10)),
                  SizedBox(width: 8,),
                  Flexible(child: Text(descricao!=null?descricao: 'carregando...', style: GoogleFonts.breeSerif(fontSize: 15)))
              ],
            ),
          )
        ],
      ),
    );
  }
}