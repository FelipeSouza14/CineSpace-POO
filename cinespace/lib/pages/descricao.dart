import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class DescriptionMovie extends StatelessWidget {
  final String name, descricao, votos, genero, bannerurl, date;

  const DescriptionMovie({Key? key, required this.name, required this.descricao, 
  required this.votos, required this.genero, required this.bannerurl, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, 
                      image: bannerurl
                      ),
                  )
                ),
                Positioned(
                  child: Text('Quantidade votada - '+votos))
              ],

            ),

          )



        ],
      ),





    );
  }
}