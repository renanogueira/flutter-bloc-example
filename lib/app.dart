import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/mangas/mangas.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
      ),
      home: const MangasPage(),
    );
  }
}
