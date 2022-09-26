import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/mangas/bloc/mangas_bloc.dart';

import 'mangas_list.dart';

class MangasPage extends StatelessWidget {
  const MangasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mangás populares'),
      ),
      body: BlocProvider(
        create: (_) => MangasBloc()..add(MangasFetched()),
        child: const MangasList(),
      ),
    );
  }
}
