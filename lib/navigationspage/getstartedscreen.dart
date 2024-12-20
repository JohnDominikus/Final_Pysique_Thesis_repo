import 'package:flutter/material.dart';
import 'package:physiqueai_apk/navigationspage/welcomescreen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isHovered = false; // State variable to track hover

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // Set the background image for the screen
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gymbackground.jpg'), // Gym background image
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Space above the logo
                SizedBox(height: screenHeight * 0.15), // Adjust this value for more/less space

                // Centered Logo
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/s.png', // Updated to use the new logo
                    fit: BoxFit.contain,
                  ),
                ),

                // Space between logo and text
                SizedBox(height: screenHeight * 0.05),

                // Text below the logo
                Text(
                  'Your fitness application and dietary tracker',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white70, // Text color set to white for visibility
                  ),
                  textAlign: TextAlign.center,
                ),

                // Space between text and button
                SizedBox(height: screenHeight * 0.05),

                // Get Started Button with hover and shadow
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered = true; // On hover, set to true
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered = false; // On hover exit, set to false
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200), // Smooth transition
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      boxShadow: isHovered
                          ? [
                              BoxShadow(
                                color: Colors.orangeAccent.withOpacity(0.6),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ]
                          : null, // Add shadow on hover
                    ),
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
                        backgroundColor: isHovered
                            ? Colors.orange // Change color on hover
                            : Colors.orangeAccent,
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
                          color: Colors.white70, // Explicitly set text color to white
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
