import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';
import 'package:tyba_test/src/presentation/pages/university.page.dart';
import 'package:tyba_test/src/presentation/widgets/university_card.widget.dart';

class HomePage extends StatefulWidget {
  static const String path = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavigationBarCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<UniversitiesBloc, UniversitiesState>(
        builder: (BuildContext __, UniversitiesState state) {
          return state.when(
            initial: () => _buildView(
              theme: theme,
              mediaSize: mediaSize,
              universities: [],
            ),
            loaded: (universities) => _buildView(
              theme: theme,
              mediaSize: mediaSize,
              universities: universities,
            ),
            error: (error) => _buildView(
              theme: theme,
              mediaSize: mediaSize,
              universities: [],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: mediaSize.width * 0.04,
        ),
        currentIndex: _bottomNavigationBarCurrentIndex,
        onTap: (int nextIndex) {
          setState(() => _bottomNavigationBarCurrentIndex = nextIndex);
        },
        items: [
          BottomNavigationBarItem(
            label: 'List',
            icon: Icon(
              Icons.list,
              size: mediaSize.width * 0.07,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Grid',
            icon: Icon(
              Icons.grid_view_rounded,
              size: mediaSize.width * 0.07,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildView({
    required Size mediaSize,
    required ThemeData theme,
    required List<UniversityModel> universities,
  }) =>
      ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: mediaSize.width * 0.025,
          vertical: mediaSize.height * 0.025,
        ),
        itemCount: universities.length,
        itemBuilder: (BuildContext __, int universityIndex) {
          final UniversityModel university = universities[universityIndex];

          return UniversityCard(
            isTheLastOne: universityIndex != universities.length - 1,
            university: university,
            onTap: () {
              Navigator.pushNamed(
                context,
                UniversityPage.path,
                arguments: {'university': university},
              );
            },
          );
        },
      );
}
