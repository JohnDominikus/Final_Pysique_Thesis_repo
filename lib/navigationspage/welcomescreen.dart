import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Import Login Screen
import 'registration_screen.dart' as reg; // Add a prefix 'reg' for the registration screen
import 'dart:ui'; // For the BackdropFilter widget

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoginHovered = false; // Track hover state for the Login button
  bool isRegisterHovered = false; // Track hover state for the Register button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Container(
            decoration: const BoxDecoration(
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
              child: Container(), // Optional: Make the blur effect more noticeable
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
                        'assets/s.png', // Replace with your logo file
                        height: 1000, // Adjust logo size as needed
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Text Section (just above login/register buttons)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
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
                const Spacer(), // Pushes the buttons to the bottom of the screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Login Button with hover effect
                    MouseRegion(
                      onEnter: (_) => setState(() => isLoginHovered = true),
                      onExit: (_) => setState(() => isLoginHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          boxShadow: isLoginHovered
                              ? [
                                  BoxShadow(
                                    color: Colors.deepOrange.withOpacity(0.6),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ]
                              : null, // Add shadow on hover
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigate to Login Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLoginHovered
                                ? Colors.orange
                                : Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.login,
                              color: Colors.white), // Login Icon
                          label: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Space between buttons

                    // Register Button with hover effect
                    MouseRegion(
                      onEnter: (_) => setState(() => isRegisterHovered = true),
                      onExit: (_) => setState(() => isRegisterHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          boxShadow: isRegisterHovered
                              ? [
                                  BoxShadow(
                                    color: Colors.orangeAccent.withOpacity(0.6),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ]
                              : null, // Add shadow on hover
                        ),
                        child: ElevatedButton.icon(
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
                            backgroundColor: isRegisterHovered
                                ? Colors.deepOrange
                                : Colors.orangeAccent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.app_registration,
                              color: Colors.white), // Register Icon
                          label: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
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
