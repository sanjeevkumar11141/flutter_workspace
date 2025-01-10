import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vcard_project/pages/scan_page.dart';

class HomePage extends StatefulWidget {

  static const String routeName = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 final List<BottomNavigationBarItem>  _bottomNavItems = const [


   BottomNavigationBarItem(
     icon: Icon(Icons.person),
     label: 'All',
   ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorite',

    ),
    // Add more items as needed
  ];

 final  _bottomNavigationBarTheme = const BottomNavigationBarThemeData(
   selectedItemColor: Colors.black,
   unselectedItemColor: Colors.grey,
   selectedLabelStyle: TextStyle(fontSize: 16.0, color: Colors.black), // Set font size for selected label
   unselectedLabelStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
   selectedIconTheme: IconThemeData(size: 30),
   unselectedIconTheme: IconThemeData(size: 30)



 );

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( // Add the FAB here
        onPressed: () {
         context.goNamed(ScanPage.routeName);
        },
        shape: const CircleBorder(),
        child:  Icon(Icons.add),
        backgroundColor: Colors.green[600],
      ),
      bottomNavigationBar:BottomAppBar(
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child:  Theme(
          data: ThemeData(bottomNavigationBarTheme: _bottomNavigationBarTheme),
          child: BottomNavigationBar(
            backgroundColor: Colors.greenAccent,
            items: _bottomNavItems, // List of navigation items
            currentIndex: _selectedIndex, // Set the current index
            onTap: (index) => setState(() => _selectedIndex = index), // Update index on tap
          ),
        ),
      )
    );
  }
}
