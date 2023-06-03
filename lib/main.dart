import 'package:app_movieis_ads/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePageState(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getMovies(),
            builder: (context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data['Search'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        elevation: 30,
                        color: Colors.blueGrey,
                        child: Stack(
                          children: [
                            Image.network(
                              snapshot.data['Search'][index]['Poster'] == "N/A"
                                  ? 'https://imobzi.storage.googleapis.com/image/layout13/image-not-found.png'
                                  : snapshot.data['Search'][index]['Poster'],
                              width: 150,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 10,
                              left: MediaQuery.of(context).size.width * 0.5,
                              //esse acima comando é para deixar centralizado e responsível
                              child:
                                  Text(snapshot.data['Search'][index]['Title']),
                            ),
                            Positioned(
                              top: 30,
                              left: MediaQuery.of(context).size.width * 0.5,
                              child: Text('Movie'),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
