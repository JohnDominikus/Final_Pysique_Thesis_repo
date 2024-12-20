import 'package:flutter/material.dart';
import 'package:physiqueai_apk/Screens/dashboard.dart'; // Dashboard Screen import
import 'package:physiqueai_apk/Modules/calendar_page.dart'; // Calendar Page import
import 'package:physiqueai_apk/Modules/daily_task.dart'; // Daily Task import
import 'package:physiqueai_apk/navigationspage/getstartedscreen.dart'; // Get Started Screen import
import 'package:physiqueai_apk/navigationspage/registration_screen.dart'; // Registration Screen import
import 'package:physiqueai_apk/navigationspage/selector_inputs_screen.dart'; // Selector Inputs import
import 'package:physiqueai_apk/Screens/bmi_calculator.dart'; // BMI Calculator import
import 'package:physiqueai_apk/Screens/healthrelatedissue.dart'; // Health Related Info Screen import
import 'package:physiqueai_apk/Screens/fitnesspreferences.dart'; // Fitness Preferences import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Physique AI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/selector_inputs': (context) => const SelectorAndInputs(),
        '/dashboard': (context) => const DashboardScreen(),
        '/calendar': (context) => const CalendarPage(),
        '/daily_task': (context) => const DailyTask(),
        '/fitness_goals': (context) => const FitnessGoalsScreen(),
        '/bmi_calculator': (context) => const BMICalculator(),
        '/health_info': (context) => const HealthRelatedScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
