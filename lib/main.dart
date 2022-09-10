import 'package:flutter/material.dart';
import 'package:tyba_test/src/app.dart';
import 'package:tyba_test/src/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(App(universitiesBloc: injector()));
}
