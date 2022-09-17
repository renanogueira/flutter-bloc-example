import 'dart:async';

import 'package:flutter_bloc_example/data/trending_mangas_api.dart';
import 'package:flutter_bloc_example/models/trending_mangas_model.dart';

class Repository {
  final trendingMangasApi = TrendingMangasApi();

  Future<TrendingMangasModel> fetchTrendingMangas() =>
      trendingMangasApi.fetchTrendingMangas();
}
