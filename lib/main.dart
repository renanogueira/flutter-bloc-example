import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/app.dart';
import 'package:flutter_bloc_example/example_bloc_observer.dart';

void main() {
  Bloc.observer = ExampleBlocObserver();
  runApp(const App());
}
