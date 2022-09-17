import 'dart:async';
import 'package:flutter_bloc_example/models/trending_mangas_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class TrendingMangasApi {
  Client client = Client();
  final _endpoint = Uri(
    scheme: 'https',
    host: 'kitsu.io',
    path: 'api/edge/trending/manga',
  );

  Future<TrendingMangasModel> fetchTrendingMangas() async {
    final response = await client.get(_endpoint);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TrendingMangasModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
