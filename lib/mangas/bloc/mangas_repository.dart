part of 'mangas_bloc.dart';

Future<List<Manga>> _fetchMangas() async {
  final response = await http.get(
    Uri.https(
      'kitsu.io',
      '/api/edge/trending/manga',
    ),
  );

  if (response.statusCode == 200) {
    final body = json.decode(response.body)['data'] as List;
    return body.map((dynamic json) => Manga.fromJson(json)).toList();
  }

  throw 'Erro ao buscar mangás';
}
