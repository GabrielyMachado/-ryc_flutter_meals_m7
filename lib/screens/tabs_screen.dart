import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TabsScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavoriteScreen()},
  ];

  static const List<BottomNavigationBarItem> _tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Categorias',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Favoritos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: _tabs,
      ),
    );
  }
}
