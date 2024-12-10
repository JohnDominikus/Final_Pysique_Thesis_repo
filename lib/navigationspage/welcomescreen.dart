import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Import Login Screen
import 'registrationsceen.dart'
    as reg; // Add a prefix 'reg' for the registration screen
import 'dart:ui'; // For the BackdropFilter widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/gymbackground.jpg'), // Gym background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Applying blur effect to background image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur effect
              child:
                  Container(), // Optional: Make the blur effect more noticeable
            ),
          ),

          // Content in the middle
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo Section (centered)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Physiquelogo.png', // Replace with your logo file
                        height: 50, // Adjust logo size as needed
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Physique',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Text Section (just above login/register buttons)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Explore all your potential with personalized fitness tracking and food recommendations.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Move the Login and Register buttons to the bottom
                Spacer(), // Pushes the buttons to the bottom of the screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to Login Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon:
                          Icon(Icons.login, color: Colors.white), // Login Icon
                      label: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20), // Space between buttons
                    // Register Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to Registration Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  reg.RegistrationScreen()), // Using prefix
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Icon(Icons.app_registration,
                          color: Colors.white), // Register Icon
                      label: Text(
                        'Register',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
