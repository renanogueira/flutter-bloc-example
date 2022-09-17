import 'package:flutter_bloc_example/models/trending_mangas_model.dart';
import 'package:flutter_bloc_example/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TrendingMangasBloc {
  final _repository = Repository();
  final _trendingMangasFetcher = PublishSubject<TrendingMangasModel>();

  Stream<TrendingMangasModel> get trendingMangas =>
      _trendingMangasFetcher.stream;

  fetchTrendingMangas() async {
    TrendingMangasModel trendingMangas =
        await _repository.fetchTrendingMangas();

    trendingMangas.mangas!.sort((a, b) =>
        b.attributes!.averageRating!.compareTo(a.attributes!.averageRating!));

    _trendingMangasFetcher.sink.add(trendingMangas);
  }

  dispose() {
    _trendingMangasFetcher.close();
  }
}

final bloc = TrendingMangasBloc();
