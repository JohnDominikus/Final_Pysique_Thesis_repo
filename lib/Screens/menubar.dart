import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  final Function(String) onMenuItemSelected; // Callback to notify selected menu

  const MenuBar({super.key, required this.onMenuItemSelected});

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  String hoveredItem = ""; // Tracks the item being hovered

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // Intercept the back button press
      onWillPop: () async {
        // If not on Dashboard, navigate back to Dashboard
        Navigator.pushReplacementNamed(context, '/dashboard');
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Bar'), // This is the AppBar title, not the "Menu Bar" text
        ),
        body: Container(
          width: 250, // Adjust the width of your menu bar
          color: Colors.blue.shade800, // Background color for the menu
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed the "selectedMenu" text display at the top
              // Only the menu items with labels and icons are displayed
              _buildMenuItem("Dashboard", Icons.dashboard),
              _buildMenuItem("Daily Task", Icons.task),
              _buildMenuItem("BMI Calculator", Icons.calculate), // Updated item
              _buildMenuItem("Progress", Icons.bar_chart),
              _buildMenuItem("Calendar", Icons.calendar_today),
              _buildMenuItem("Exercise", Icons.fitness_center),
              _buildMenuItem("Settings", Icons.settings),
              _buildMenuItem("Log Out", Icons.logout),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create a menu item with hover effects
  Widget _buildMenuItem(String title, IconData icon) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredItem = title; // Set the hovered item
        });
      },
      onExit: (_) {
        setState(() {
          hoveredItem = ""; // Reset hovered item
        });
      },
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: hoveredItem == title ? Colors.yellow : Colors.white, // Change color on hover
            fontWeight: hoveredItem == title ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          widget.onMenuItemSelected(title); // Notify about the selected menu

          // Navigate based on the selected menu
          switch (title) {
            case "Dashboard":
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case "Daily Task":
              Navigator.pushReplacementNamed(context, '/daily_task');
              break;
            case "BMI Calculator": // Navigate to the BMI Calculator
              Navigator.pushReplacementNamed(context, '/bmi_calculator');
              break;
            case "Progress":
              Navigator.pushReplacementNamed(context, '/progress');
              break;
            case "Calendar":
              // Use push to keep Dashboard in stack
              Navigator.pushNamed(context, '/calendar');
              break;
            case "Exercise":
              Navigator.pushReplacementNamed(context, '/exercise');
              break;
            case "Settings":
              Navigator.pushReplacementNamed(context, '/settings');
              break;
            case "Log Out":
              Navigator.pushReplacementNamed(context, '/register'); // Go to registration if Log Out
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
