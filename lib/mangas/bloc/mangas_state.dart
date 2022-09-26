part of 'mangas_bloc.dart';

enum MangasStatus { initial, success, failure }

class MangasState extends Equatable {
  const MangasState({
    this.status = MangasStatus.initial,
    this.mangas = const <Manga>[],
    this.error = '',
  });

  final MangasStatus status;
  final List<Manga> mangas;
  final String error;

  MangasState copyWith({
    MangasStatus? status,
    List<Manga>? mangas,
    String? error,
  }) {
    return MangasState(
      status: status ?? this.status,
      mangas: mangas ?? this.mangas,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'MangaState { '
        'status: $status'
        ', mangas: ${mangas.length}'
        '${error.isNotEmpty ? ', error: $error' : ''}'
        ' }';
  }

  @override
  List<Object> get props => [status, mangas, error];
}
