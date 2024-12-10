import 'package:flutter/material.dart';

class DietaryPage extends StatelessWidget {
  const DietaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: 100,
            color: Colors.orange,
          ),
          SizedBox(height: 20),
          Text(
            'Dietary Module',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
