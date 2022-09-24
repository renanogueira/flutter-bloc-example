import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/mangas/bloc/mangas_bloc.dart';
import 'package:flutter_bloc_example/mangas/widgets/widgets.dart';

class MangasList extends StatelessWidget {
  const MangasList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangasBloc, MangasState>(
      builder: (context, state) {
        switch (state.status) {
          case MangasStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case MangasStatus.failure:
            return const Center(child: Text('failed to fetch mangas'));
          case MangasStatus.success:
            return ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return MangaCard(manga: state.mangas[index]);
              },
              itemCount: state.mangas.length,
            );
        }
      },
    );
  }
}
