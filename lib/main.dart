import 'package:bloc/bloc.dart';
import 'package:bloc_project/src/app.dart';
import 'package:bloc_project/src/counter_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );
}
