import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/di/injector.dart';
import 'package:tyba_test/src/presentation/pages/camera.page.dart';
import 'package:tyba_test/src/presentation/pages/camera_preview.page.dart';
import 'package:tyba_test/src/presentation/pages/home.page.dart';
import 'package:tyba_test/src/presentation/pages/splash.page.dart';
import 'package:tyba_test/src/presentation/pages/university.page.dart';

class App extends StatefulWidget {
  final UniversitiesBloc universitiesBloc;

  const App({required this.universitiesBloc, super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext _) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext __) => widget.universitiesBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tyba Universities Demo',
        theme: ThemeData(
          cardColor: const Color(0xffffffff),
          backgroundColor: const Color(0xff006E5B),
          scaffoldBackgroundColor: const Color(0xff04A388),
          colorScheme: const ColorScheme(
            primary: Color(0xff006E5B),
            onPrimary: Color(0xff04A388),
            brightness: Brightness.dark,
            secondary: Color(0xffFE790F),
            onSecondary: Color(0xffFE933E),
            error: Color(0xffDA4253),
            onError: Color(0xffDA4253),
            background: Color(0xffffffff),
            onBackground: Color(0xffffffff),
            surface: Color(0xffffffff),
            onSurface: Color(0xffffffff),
          ),
        ),
        initialRoute: SplashPage.path,
        routes: {
          HomePage.path: (BuildContext __) => const HomePage(),
          CameraPage.path: (BuildContext __) =>
              CameraPage(universitiesBloc: injector()),
          CameraPreviewPage.path: (BuildContext __) =>
              CameraPreviewPage(universitiesBloc: injector()),
          SplashPage.path: (BuildContext __) => SplashPage(),
          UniversityPage.path: (BuildContext __) =>
              UniversityPage(universitiesBloc: injector()),
        },
      ),
    );
  }
}
