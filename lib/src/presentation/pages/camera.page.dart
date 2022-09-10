import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/src/blocs/universities/universities.bloc.dart';
import 'package:tyba_test/src/presentation/pages/camera_preview.page.dart';

class CameraPage extends StatefulWidget {
  static const String path = '/camera';

  final UniversitiesBloc universitiesBloc;

  const CameraPage({required this.universitiesBloc, super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    widget.universitiesBloc.cameraInitializer().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (widget.universitiesBloc.isCameraInitialized)
              CameraPreview(widget.universitiesBloc.cameraController),
            if (!widget.universitiesBloc.isCameraInitialized)
              const ColoredBox(
                color: Colors.black,
                child: Center(child: CircularProgressIndicator()),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                          _isRearCameraSelected
                              ? Icons.camera_alt_outlined
                              : Icons.camera_alt,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isRearCameraSelected = !_isRearCameraSelected;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () async =>
                            widget.universitiesBloc.takePicture(
                          onDone: (XFile picture) {
                            Navigator.pushNamed(
                              context,
                              CameraPreviewPage.path,
                              arguments: {'picture': picture},
                            );
                          },
                          onError: (error) {},
                        ),
                        iconSize: mediaSize.width * 0.15,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
