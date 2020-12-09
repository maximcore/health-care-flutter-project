import 'package:flutter/material.dart';
import 'package:health_and_care/navigation/tab_navigation_item.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('Building Tab Page');
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for(final tabItem in TabNavigationItem.items) tabItem.page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(()=> _currentIndex = index),
        items: [
          for(final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              title: tabItem.title,
              backgroundColor: Colors.deepPurple,
            )
        ],
      ),
    );
  }
}