import 'package:atrueque/utils/colors.dart';
import 'package:flutter/material.dart';

import 'pages/articulos/articulos_page.dart';
import 'pages/cuenta/cuenta_page.dart';
import 'pages/home/home_page.dart';
import 'pages/message/message_page.dart';
import 'pages/trueque/trueque_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const MessageScreen(),
    const TruequeScreen(),
    const ArticulosScreen(),
    const CuentaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ATRUEQUE",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.mail),
            color: Colors.white,
            onPressed: () {
              // context.go('/message');
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              // context.go('/perfil');
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para el botón de trueque
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.swap_horiz,
          color: whiteColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        iconSize: 26,
        unselectedIconTheme: IconThemeData(size: 26, color: Colors.grey[400]),
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert_circle_outlined),
            label: 'Trueques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Artículos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Cuenta',
          ),
        ],
      ),
    );
  }
}
