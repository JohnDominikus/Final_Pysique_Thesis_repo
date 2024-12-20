import 'package:flutter/material.dart';
import 'healthrelatedissue.dart'; // Import the HealthRelatedScreen

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  int weight = 65;
  int age = 26;
  double height = 170.0;
  double bmi = 0.0;
  String status = '';
  String healthMessage = '';

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  void showBMIResult(BuildContext context) {
    setState(() {
      bmi = calculateBMI();
      if (bmi < 18.5) {
        status = 'Underweight';
        healthMessage = 'Consider gaining weight for better health.';
      } else if (bmi < 25) {
        status = 'Normal';
        healthMessage = 'Keep up the good work!';
      } else if (bmi < 30) {
        status = 'Overweight';
        healthMessage = 'Try to focus on a balanced diet and exercise.';
      } else {
        status = 'Obese';
        healthMessage = 'Consider a more active lifestyle and a healthier diet.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to the Dashboard when the back button is pressed
        Navigator.pushReplacementNamed(context, '/dashboard');
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
          // Wrap the body with SingleChildScrollView to avoid overflow
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade100, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Please choose your gender',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderCard(
                      icon: Icons.male,
                      label: 'Male',
                      isSelected: isMale,
                      onTap: () => setState(() => isMale = true),
                    ),
                    const SizedBox(width: 10),
                    GenderCard(
                      icon: Icons.female,
                      label: 'Female',
                      isSelected: !isMale,
                      onTap: () => setState(() => isMale = false),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Modify Values',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueCard(
                      label: 'Weight (kg)',
                      value: weight.toString(),
                      onIncrement: () => setState(() => weight++),
                      onDecrement: () => setState(() => weight--),
                    ),
                    ValueCard(
                      label: 'Age',
                      value: age.toString(),
                      onIncrement: () => setState(() => age++),
                      onDecrement: () => setState(() => age--),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Height (cm)',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Column(
                    children: [
                      Slider(
                        activeColor: Colors.orange,
                        inactiveColor: Colors.grey.shade300,
                        value: height,
                        min: 100,
                        max: 220,
                        onChanged: (newValue) =>
                            setState(() => height = newValue),
                      ),
                      Text(
                        '${height.toInt()} cm',
                        style:
                            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => showBMIResult(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                if (bmi > 0)
                  Column(
                    children: [
                      Text(
                        'Your BMI: ${bmi.toStringAsFixed(1)}',
                        style:
                            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        status,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.orangeAccent),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        healthMessage,
                        style:
                            const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to HealthRelatedScreen when "Next" is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HealthRelatedScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? Colors.orangeAccent : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.orangeAccent, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon,
                  size: 40,
                  color: isSelected ? Colors.white : Colors.orangeAccent),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValueCard extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValueCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.orangeAccent, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(value,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.orangeAccent),
                  onPressed: onDecrement,
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.orangeAccent),
                  onPressed: onIncrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
