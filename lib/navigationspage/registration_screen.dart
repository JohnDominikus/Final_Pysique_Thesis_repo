import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter widget

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isHovered = false;

  void handleRegistration(BuildContext context) {
    if (passwordController.text == confirmPasswordController.text) {
      Navigator.pushNamed(context, '/selector_inputs'); // Navigate to SelectorAndInputs
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gymbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // Registration Form
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/s.png',
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Join the Fitness Journey!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    buildTextField(usernameController, 'Username', Icons.fitness_center),
                    const SizedBox(height: 20),
                    buildTextField(fullNameController, 'Full Name', Icons.person),
                    const SizedBox(height: 20),
                    buildTextField(emailController, 'Email', Icons.email),
                    const SizedBox(height: 20),
                    buildTextField(passwordController, 'Password', Icons.lock, true),
                    const SizedBox(height: 20),
                    buildTextField(confirmPasswordController, 'Confirm Password', Icons.lock_outline, true),
                    const SizedBox(height: 30),
                    // Register Button
                    MouseRegion(
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          boxShadow: isHovered
                              ? [const BoxShadow(color: Colors.orangeAccent, blurRadius: 20)]
                              : null,
                        ),
                        child: ElevatedButton(
                          onPressed: () => handleRegistration(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Already have an account? LOGIN'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label, IconData icon, [bool obscureText = false]) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
