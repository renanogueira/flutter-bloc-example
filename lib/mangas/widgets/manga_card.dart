import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/mangas/models/models.dart';

class MangaCard extends StatelessWidget {
  const MangaCard({
    Key? key,
    required Manga manga,
  })  : _manga = manga,
        super(key: key);

  final Manga _manga;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  _manga.attributes.posterImage?.large.toString() ?? '',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(_manga.attributes.canonicalTitle ?? ''),
            subtitle: Text(
              'Avaliação: ${_manga.attributes.averageRating ?? 'N/A'}',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
