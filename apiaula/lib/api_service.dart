import 'dart:convert';

import 'package:apiaula/album.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https//jsonplaceholder.typicode.com/albuns";

  //Get
  Future<List<Album>> getAlbums() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) {
        return Album.fromMap(item);
      }).toList();
    }
    return [];
  }

  //POST
  Future<Album?> createAlbum(Album album) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(album.toMap()),
    );
    if (response.statusCode == 200) {
      print("Dado incluido com sucesso");
      return Album.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  //PUT
  Future<Album?> updateAlbum(Album album, int id) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(album.toMap()),
    );
    if (response.statusCode == 200) {
      print("Dado atualizado com sucesso");
      return Album.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  //DELETE
  Future<void> deleteAlbum(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      print("Dado deletado com sucesso");
    }
  }
}
