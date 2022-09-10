import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/data/models/university/university.model.dart';
import 'package:tyba_test/src/presentation/pages/camera.page.dart';

class UniversityPage extends StatefulWidget {
  final UniversitiesBloc universitiesBloc;
  static const String path = '/university';

  const UniversityPage({required this.universitiesBloc, super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  UniversityModel? university;

  @override
  void didChangeDependencies() {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      Navigator.of(context).pop();
      super.didChangeDependencies();
      return;
    }

    final UniversityModel? _university =
        arguments['university'] as UniversityModel?;

    if (_university == null) {
      Navigator.of(context).pop();
      super.didChangeDependencies();
      return;
    }

    university = _university;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    final Widget? photo = university != null && university!.photo != null
        ? Image.memory(
            Uint8List.fromList(university!.photo!.codeUnits),
            fit: BoxFit.cover,
          )
        : null;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (university != null) {
            Navigator.pushNamed(
              context,
              CameraPage.path,
              arguments: {'university': university},
            );
          }
        },
        backgroundColor: theme.colorScheme.secondary,
        splashColor: theme.colorScheme.onSecondary,
        child: Center(
          child: Icon(
            Icons.add_photo_alternate_outlined,
            color: Colors.white,
            size: mediaSize.width * 0.08,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          if (university != null) ...[
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: theme.colorScheme.primary,
              expandedHeight: photo == null ? null : mediaSize.height * 0.2,
              flexibleSpace: photo,
              title: photo == null ? Text(university?.name ?? '') : null,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (university!.name.isNotEmpty) ...[
                  SizedBox(height: mediaSize.height * 0.05),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(mediaSize.width * 0.05),
                          child: Text(
                            university!.name,
                            style: TextStyle(fontSize: mediaSize.width * 0.06),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                if (university!.stateProvince.isNotEmpty) ...[
                  SizedBox(height: mediaSize.height * 0.01),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(mediaSize.width * 0.05),
                          child: Text(
                            university!.stateProvince,
                            style: TextStyle(fontSize: mediaSize.width * 0.06),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                if (university!.webPages.isNotEmpty)
                  ...university!.webPages
                      .map(
                        (String webPage) => Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(mediaSize.width * 0.05),
                                child: Text(
                                  webPage,
                                  style: TextStyle(
                                      fontSize: mediaSize.width * 0.06),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                if (university!.domains.isNotEmpty)
                  ...university!.domains
                      .map(
                        (String domain) => Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(mediaSize.width * 0.05),
                                child: Text(
                                  domain.replaceAll('.', ' '),
                                  style: TextStyle(
                                      fontSize: mediaSize.width * 0.06),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
