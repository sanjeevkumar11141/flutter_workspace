import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/pages/home/browse_templates/browse_templates_page.dart';
import 'package:web_app_demo_first/pages/home/dashboard/dashboard_page.dart';
import 'package:web_app_demo_first/pages/home/inspection_flows/inspection_flows_page.dart';
import 'package:web_app_demo_first/pages/home/new_inspection/new_inspection_page.dart';
import 'package:web_app_demo_first/pages/home/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default selected index for "New Inspection"

  final List<Widget> _pages = [
    const NewInspectionPage(),
    const DashboardPage(),
    const InspectionFlowsPage(),
    const BrowseTemplatesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Larger screens: Show persistent sidebar
          return Scaffold(
            body: Row(
              children: [
                // Persistent Drawer
                Container(
                  width: 250,
                  color: Colors.black,
                  child: _buildDrawerContent(),
                ),
                // Content Area
                Expanded(
                  child: SingleChildScrollView(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      child: _pages[_selectedIndex], // Display selected page
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // Smaller screens: Use a regular Drawer
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              backgroundColor: Colors.black,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu,  color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            drawer: _buildDrawer(),
            body: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: _pages[_selectedIndex], // Display selected page
              ),
            ),
          );
        }
      },
    );
  }

  // Build the navigation drawer
  Drawer _buildDrawer() {
    return Drawer(
      child: _buildDrawerContent(),
    );
  }

  // Drawer content as a reusable widget
  Widget _buildDrawerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom Header
        Container(
          color: Colors.black,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            'devrio',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // Drawer Items
        _buildDrawerItem(Icons.add, 'New Inspection', 0),
        _buildDrawerItem(Icons.dashboard, 'Dashboard', 1),
        _buildDrawerItem(Icons.assignment, 'Inspection Flows', 2),
        _buildDrawerItem(Icons.file_copy, 'Browse Templates', 3),
        _buildDrawerItem(Icons.settings, 'Settings', 4),
        const Spacer(),
        _buildDrawerItem(Icons.support, 'Support', null),
        _buildDrawerItem(Icons.logout, 'Log Out', null),
      ],
    );
  }

  // Build individual drawer items
  Widget _buildDrawerItem(IconData icon, String title, int? index) {
    final isSelected = index == _selectedIndex; // Check if the item is selected

    return Container(
      color: isSelected ? Colors.white : Colors.black, // Set background color
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.white, // Set icon color
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white, // Set text color
          ),
        ),
        onTap: () {
          if (index != null) {
            setState(() {
              _selectedIndex = index; // Update selected index
            });
            if (MediaQuery.of(context).size.width <= 600) {
              Navigator.pop(context); // Close the drawer on small screens
            }
          } else {
            // Handle actions for non-indexed items like Support and Log Out
            if(title == "Log Out"){
              context.go('/');
            }else{

            }
          }
        },
      ),
    );
  }
}


