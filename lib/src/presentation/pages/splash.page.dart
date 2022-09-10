import 'package:flutter/material.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/di/injector.dart';
import 'package:tyba_test/src/presentation/pages/home.page.dart';

class SplashPage extends StatefulWidget {
  static const String path = '/splash';

  final UniversitiesBloc universitiesBloc = injector();

  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _ready = false;

  @override
  void initState() {
    if (!_ready) {
      widget.universitiesBloc.fetchData((universities) async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.path,
          (route) => true,
        );

        setState(() => _ready = true);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/tyba-logo.png',
          width: mediaSize.width * 0.25,
          height: mediaSize.width * 0.25,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
