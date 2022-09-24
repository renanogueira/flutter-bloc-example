import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/mangas/models/models.dart';
import 'package:http/http.dart' as http;

part 'mangas_event.dart';
part 'mangas_state.dart';

class MangasBloc extends Bloc<MangasEvent, MangasState> {
  MangasBloc({required this.httpClient}) : super(const MangasState()) {
    on<MangasFetched>(_onMangaFetched);
  }

  final http.Client httpClient;

  Future<void> _onMangaFetched(
      MangasFetched event, Emitter<MangasState> emit) async {
    try {
      if (state.status == MangasStatus.initial) {
        final mangas = await _fetchMangas();
        return emit(
          state.copyWith(
            status: MangasStatus.success,
            mangas: mangas,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: MangasStatus.failure));
    }
  }

  Future<List<Manga>> _fetchMangas() async {
    final response = await httpClient.get(
      Uri.https(
        'kitsu.io',
        '/api/edge/trending/manga',
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body)['data'] as List;
      return body.map((dynamic json) => Manga.fromJson(json)).toList();
    }

    throw Exception('Erro ao buscar mangás');
  }
}
