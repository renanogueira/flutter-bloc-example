import 'package:flutter/material.dart';

import '../blocs/trending_mangas_bloc.dart';
import '../models/trending_mangas_model.dart';
import '../widgets/manga_card_widget.dart';

class TrendingMangasScreen extends StatefulWidget {
  const TrendingMangasScreen({Key? key}) : super(key: key);

  @override
  State<TrendingMangasScreen> createState() => _TrendingMangasScreenState();
}

class _TrendingMangasScreenState extends State<TrendingMangasScreen> {
  @override
  void initState() {
    bloc.fetchTrendingMangas();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mangás populares'),
      ),
      body: StreamBuilder(
        stream: bloc.trendingMangas,
        builder: (
          context,
          AsyncSnapshot<TrendingMangasModel> snapshot,
        ) {
          if (snapshot.hasData) {
            return buildList(snapshot.data!.mangas);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(List<Manga>? mangas) {
    return ListView.builder(
      itemCount: mangas?.length ?? 0,
      itemBuilder: (BuildContext context, index) => MangaCardWidget(
        manga: mangas![index],
      ),
    );
  }
}
