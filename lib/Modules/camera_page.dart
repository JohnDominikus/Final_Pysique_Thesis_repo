import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.camera_alt,
        size: 100,
        color: Colors.blue,
      ),
    );
  }
}
