import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';

class CameraPreviewPage extends StatefulWidget {
  static const String path = '/camera/preview';

  final UniversitiesBloc universitiesBloc;

  const CameraPreviewPage({required this.universitiesBloc, super.key});

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  @override
  void dispose() {
    widget.universitiesBloc.cameraDispose().then((_) => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(
              File(widget.universitiesBloc.cameraFile.path),
              fit: BoxFit.cover,
              width: 250,
            ),
            const SizedBox(height: 24),
            Text(widget.universitiesBloc.cameraFile.name)
          ],
        ),
      ),
    );
  }
}
