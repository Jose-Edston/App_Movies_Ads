import 'package:app_movieis_ads/api.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  String id;
  String img;

  MovieDetail({
    super.key,
    required this.id,
    required this.img,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nome do Filme'),
      ),
      backgroundColor: Colors.grey,
      // Stack é para ele trabalhar sobre camadas
      body: FutureBuilder(
        future: getMovie(widget.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                // Positioned é para posicionar onde quer o elemento na tela e ele só pode ser criado dentro de uma Stack
                Positioned(
                  bottom: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data['Title'] == "N/A"
                            ? 'Titulo sem informação'
                            : 'Título: ' + snapshot.data['Title']),
                        Text(snapshot.data['Year'] == "N/A"
                            ? 'Ano não disponível'
                            : 'Ano: ' + snapshot.data['Year']),
                        Text(snapshot.data['Runtime'] == "N/A"
                            ? "Duração não disponível"
                            : 'Duração: ' + snapshot.data['Runtime']),
                        Text(snapshot.data['Genre'] == "N/A"
                            ? 'Gênero não disponível'
                            : 'Gênero: ' + snapshot.data['Genre']),
                        Text(snapshot.data['Director'] == "N/A"
                            ? 'Sem informação do Diretor'
                            : 'Diretor (s): ' + snapshot.data['Director']),
                        Text(snapshot.data['Writer'] == "N/A"
                            ? 'Sem infomração  de escritor (9)es)'
                            : 'Escritor (es): ' + snapshot.data['Writer']),
                        Text(snapshot.data['Actors'] == "N/A"
                            ? 'Sem informação dos Atores'
                            : 'Atores: ' + snapshot.data['Actors']),
                        Text(snapshot.data['Language'] == "N/A"
                            ? 'Sem informações de linguagem'
                            : 'Linguagem: ' + snapshot.data['Language']),
                        Text(snapshot.data['Country'] == "N/A"
                            ? 'Sem informação do país de origem'
                            : 'País de origem: ' + snapshot.data['Country']),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.25,
                  top: 35,
                  child: Hero(
                    tag: widget.id,
                    child: Image.network(
                      widget.img,
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
