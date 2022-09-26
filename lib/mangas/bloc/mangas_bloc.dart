import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/mangas/models/models.dart';
import 'package:http/http.dart' as http;

part 'mangas_event.dart';
part 'mangas_repository.dart';
part 'mangas_state.dart';

class MangasBloc extends Bloc<MangasEvent, MangasState> {
  MangasBloc() : super(const MangasState()) {
    on<MangasFetched>(_onMangasFetched);
  }

  Future<void> _onMangasFetched(
      MangasFetched event, Emitter<MangasState> emit) async {
    try {
      if (state.status == MangasStatus.initial) {
        final mangas = await _fetchMangas();

        mangas.sort(
          (a, b) =>
              b.attributes.averageRating.compareTo(a.attributes.averageRating),
        );

        return emit(
          state.copyWith(
            status: MangasStatus.success,
            mangas: mangas,
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(
        status: MangasStatus.failure,
        error: error.toString(),
      ));
    }
  }
}
