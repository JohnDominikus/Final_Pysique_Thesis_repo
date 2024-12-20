import 'package:flutter/material.dart';
import 'package:physiqueai_apk/Screens/fitnesspreferences.dart';
import 'dashboard.dart'; // Import the FitnessDashboardScreen

class HealthRelatedScreen extends StatefulWidget {
  const HealthRelatedScreen({super.key});

  @override
  _HealthRelatedScreenState createState() => _HealthRelatedScreenState();
}

class _HealthRelatedScreenState extends State<HealthRelatedScreen> {
  bool hasHealthCondition = false;
  TextEditingController conditionController = TextEditingController();
  List<String> allergens = ['Peanuts', 'Dairy', 'Gluten', 'Shellfish'];
  List<bool> selectedAllergens = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Health Related Info'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Allergens
            const Text('Select your allergens:', style: TextStyle(fontSize: 18)),
            ...List.generate(allergens.length, (index) {
              return CheckboxListTile(
                title: Text(allergens[index]),
                value: selectedAllergens[index],
                onChanged: (bool? value) {
                  setState(() {
                    selectedAllergens[index] = value!;
                  });
                },
              );
            }),

            const SizedBox(height: 20),

            // Health Condition Checkbox
            CheckboxListTile(
              title: const Text('Do you have any health conditions?'),
              value: hasHealthCondition,
              onChanged: (bool? value) {
                setState(() {
                  hasHealthCondition = value!;
                });
              },
            ),

            // Health Condition Text Field (only visible if checked)
            if (hasHealthCondition)
              TextField(
                controller: conditionController,
                decoration: const InputDecoration(
                  labelText: 'Please specify your health condition:',
                  border: OutlineInputBorder(),
                ),
              ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle submit logic here
              },
              child: const Text('Submit'),
            ),

            const SizedBox(height: 20),

            // Temporary button to navigate to FitnessDashboardScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FitnessGoalsScreen()),
                );
              },
              child: const Text('Go to Fitness Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
