part of 'mangas_bloc.dart';

enum MangasStatus { initial, success, failure }

class MangasState extends Equatable {
  const MangasState({
    this.status = MangasStatus.initial,
    this.mangas = const <Manga>[],
  });

  final MangasStatus status;
  final List<Manga> mangas;

  MangasState copyWith({
    MangasStatus? status,
    List<Manga>? mangas,
  }) {
    return MangasState(
        status: status ?? this.status, mangas: mangas ?? this.mangas);
  }

  @override
  String toString() {
    return '''MangaState { $status, mangas: ${mangas.length} }''';
  }

  @override
  List<Object> get props => [status, mangas];
}
