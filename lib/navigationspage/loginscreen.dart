import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui'; // For the BackdropFilter widget
import 'package:physiqueai_apk/Screens/dashboard.dart'; // Import the DashboardScreen
import 'package:physiqueai_apk/firebase_options.dart' as firebaseOptions; // Alias for firebase_options
import 'package:physiqueai_apk/navigationspage/registration_screen.dart' as registrationScreen; // Alias for registration_screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignInHovered = false; // Hover state for Sign In button
  bool isGoogleHovered = false; // Hover state for Google button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gymbackground.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.3)), // Dark overlay
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  // Centered Logo
                  Center(
                    child: Image.asset(
                      'assets/s.png', // Logo image
                      height: 500, // Adjust logo size as needed
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Welcome Text
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please enter login details below',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email Input
                  buildTextField('Email', 'Enter your email', false),
                  const SizedBox(height: 20),
                  // Password Input
                  buildTextField('Password', 'Enter your password', true),
                  const SizedBox(height: 10),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Add Forgot Password logic here
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button with Hover Effect
                  buildSignInButton(),
                  const SizedBox(height: 20),
                  // Google Button with Hover Effect
                  buildGoogleSignInButton(),
                  const SizedBox(height: 20),
                  // Sign Up Redirection
                  buildSignUpRedirect(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build TextField widgets
  Widget buildTextField(String label, String hint, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  // Helper method to build Sign In Button with hover effect
  Widget buildSignInButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isSignInHovered = true),
      onExit: (_) => setState(() => isSignInHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          boxShadow: isSignInHovered
              ? [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.6),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null, // Shadow on hover
        ),
        child: ElevatedButton(
          onPressed: () {
            // Add Sign-in logic here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSignInHovered ? Colors.orange : Colors.deepOrange,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Helper method to build Google Sign In Button with hover effect
  Widget buildGoogleSignInButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isGoogleHovered = true),
      onExit: (_) => setState(() => isGoogleHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          boxShadow: isGoogleHovered
              ? [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.6),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null, // Shadow on hover
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            // Add Google Sign-In logic here
          },
          icon: const Icon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          label: const Text(
            'Log in with Google',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build Sign Up Redirection button
  Widget buildSignUpRedirect() {
    return TextButton(
      onPressed: () {
        // Navigate to the Registration Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const registrationScreen.RegistrationScreen()), // Navigate to RegistrationScreen
        );
      },
      child: const Text(
        'Don\'t have an account? Sign Up',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
