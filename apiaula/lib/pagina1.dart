import 'package:apiaula/album.dart';
import 'package:apiaula/api_service.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  ApiService apiService = ApiService();
  List<Album> albums = [];

  void _loadAlbums() async {
    var list = await apiService.getAlbums();
    setState(() {
      albums = list;
    });
  }

  @override
  void initState() {
    _loadAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo API Aula"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text('${albums[index].userId} - ${albums[index].id}'),
                  subtitle: Text('${albums[index].title}'),
                ),
              ),
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add_box_outlined),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.delete_outline),
          )
        ],
      ),
    );
  }
}
