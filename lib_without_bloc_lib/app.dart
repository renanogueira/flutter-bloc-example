import 'package:flutter/material.dart';

import 'screens/trending_mangas_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
      ),
      home: const Scaffold(
        body: TrendingMangasScreen(),
      ),
    );
  }
}
