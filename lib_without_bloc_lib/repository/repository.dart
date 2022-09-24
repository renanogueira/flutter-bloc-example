import 'dart:async';

import '../data/trending_mangas_api.dart';
import '../models/trending_mangas_model.dart';

class Repository {
  final trendingMangasApi = TrendingMangasApi();

  Future<TrendingMangasModel> fetchTrendingMangas() =>
      trendingMangasApi.fetchTrendingMangas();
}
