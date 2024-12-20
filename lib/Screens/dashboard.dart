import 'package:flutter/material.dart';
import 'package:physiqueai_apk/Screens/menubar.dart' as custom; // Alias 'menubar.dart' import
import 'package:physiqueai_apk/Modules/calendar_page.dart'; // Import CalendarPage
import 'package:physiqueai_apk/modules/daily_task.dart'; // Import DailyTaskScreen (make sure this exists)

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedMenu = "Dashboard"; // Tracks selected menu option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        title: null, // Removed the app bar title
      ),
      // Drawer is added to the Scaffold
      drawer: Drawer(
        child: custom.MenuBar(
          onMenuItemSelected: (menu) {
            setState(() {
              selectedMenu = menu; // Update the selected menu when the menu item is selected
            });
          },
        ),
      ),
      body: Row(
        children: [
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Selected Menu Name placed above the search bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    selectedMenu, // Displays the selected menu
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
                // Search Bar at the top
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                // Content Below the Search Bar
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Remove or comment this text to eliminate the selected menu label
                        // Text(
                        //   'Selected Menu: $selectedMenu',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
