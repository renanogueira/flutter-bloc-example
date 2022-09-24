part of 'mangas_bloc.dart';

abstract class MangasEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MangasFetched extends MangasEvent {}
