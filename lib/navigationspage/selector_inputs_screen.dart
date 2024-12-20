import 'package:flutter/material.dart';

class SelectorAndInputs extends StatefulWidget {
  const SelectorAndInputs({super.key});

  @override
  _SelectorAndInputsState createState() => _SelectorAndInputsState();
}

class _SelectorAndInputsState extends State<SelectorAndInputs> {
  bool isMaleSelected = true;
  double weight = 60.0;
  String selectedHeight = "160 cm";
  int age = 25;

  // Dropdown Data
  final List<String> heightOptions = [
    "150 cm",
    "155 cm",
    "160 cm",
    "165 cm",
    "170 cm",
    "175 cm",
    "180 cm"
  ];

  final List<String> bodyTypes = ["Ectomorph", "Mesomorph", "Endomorph"];
  final List<String> bodyGoals = ["Lose Weight", "Build Muscle", "Maintain Fitness"];

  // Dropdown Selections
  String selectedBodyType = "Ectomorph";
  String selectedBodyGoal = "Lose Weight";

  // Radio Button Selection
  String userLevel = "Beginner";

  // Health Issue Question
  String healthIssueAnswer = "No";
  String healthIssueDescription = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Welcome to Physique Ai',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gender Selector
              Center(
                child: ToggleButtons(
                  isSelected: [isMaleSelected, !isMaleSelected],
                  onPressed: (index) {
                    setState(() => isMaleSelected = index == 0);
                  },
                  children: const [
                    Padding(padding: EdgeInsets.all(8.0), child: Text('Male')),
                    Padding(padding: EdgeInsets.all(8.0), child: Text('Female')),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Combined Row for Weight, Height, and Age
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Weight
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weight: ${weight.toStringAsFixed(1)} kg"),
                        Slider(
                          value: weight,
                          min: 40,
                          max: 150,
                          onChanged: (value) => setState(() => weight = value),
                        ),
                      ],
                    ),
                  ),

                  // Height Dropdown
                  Expanded(
                    child: Row(
                      children: [
                        const Text("Height: "),
                        DropdownButton<String>(
                          value: selectedHeight,
                          items: heightOptions
                              .map((h) => DropdownMenuItem(value: h, child: Text(h)))
                              .toList(),
                          onChanged: (value) => setState(() => selectedHeight = value!),
                        ),
                      ],
                    ),
                  ),

                  // Age Section
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Age: $age"),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  setState(() => age = (age > 1) ? age - 1 : age),
                              icon: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 32), // 2-inch spacing approximation
                            IconButton(
                              onPressed: () =>
                                  setState(() => age = (age < 120) ? age + 1 : age),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Body Type Dropdown
              Row(
                children: [
                  const Text("Body Type: "),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedBodyType,
                    items: bodyTypes
                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedBodyType = value!),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Body Goal Dropdown
              Row(
                children: [
                  const Text("Body Goal: "),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedBodyGoal,
                    items: bodyGoals
                        .map((goal) => DropdownMenuItem(value: goal, child: Text(goal)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedBodyGoal = value!),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // User Level Radio Buttons
              const Text("Select Your Level:"),
              Row(
                children: [
                  Radio<String>(
                    value: "Beginner",
                    groupValue: userLevel,
                    onChanged: (value) => setState(() => userLevel = value!),
                  ),
                  const Text("Beginner"),
                  Radio<String>(
                    value: "Intermediate",
                    groupValue: userLevel,
                    onChanged: (value) => setState(() => userLevel = value!),
                  ),
                  const Text("Intermediate"),
                  Radio<String>(
                    value: "Expert",
                    groupValue: userLevel,
                    onChanged: (value) => setState(() => userLevel = value!),
                  ),
                  const Text("Expert"),
                ],
              ),

              const SizedBox(height: 20),

              // Health Issue Question
              const Text("Do you have any health issues?"),
              Row(
                children: [
                  Radio<String>(
                    value: "Yes",
                    groupValue: healthIssueAnswer,
                    onChanged: (value) => setState(() => healthIssueAnswer = value!),
                  ),
                  const Text("Yes"),
                  Radio<String>(
                    value: "No",
                    groupValue: healthIssueAnswer,
                    onChanged: (value) => setState(() => healthIssueAnswer = value!),
                  ),
                  const Text("No"),
                ],
              ),

              // Health Issue Description TextBox
              if (healthIssueAnswer == "Yes")
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: "Please describe your health issues",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => healthIssueDescription = value),
                  ),
                ),

              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to FitnessDashboardScreen after submit
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
