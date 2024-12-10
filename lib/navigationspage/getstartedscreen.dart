import 'package:flutter/material.dart';
import 'package:physiqueai_apk/navigationspage/loginscreen.dart';
import 'package:physiqueai_apk/navigationspage/welcomescreen.dart';
import '../Screens/fitnesspreferences.dart'; // Replace with your next screen

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade900, // Keep the background dark
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Welcome to Physique',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Your fitness application and dietary tracker',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/Physiquelogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),

                // Get Started Button with larger size and hover effect
                MouseRegion(
                  onEnter: (_) {
                    // Change button size on hover (if applicable)
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03, // Increase button height
                        horizontal: screenWidth * 0.1, // Increase button width
                      ),
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.06, // Larger text size
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color:
                            Colors.white, // Explicitly set text color to white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                Text(
                  'By pressing "Get Started", you will begin setting up your fitness and dietary goals.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
