// routes.dart
import 'package:atrueque/ui/auth/index_page.dart';
import 'package:atrueque/ui/auth/select_category_page.dart';
import 'package:atrueque/ui/main_page.dart';
import 'package:atrueque/ui/auth/login_page.dart';
import 'package:atrueque/ui/auth/register_screen.dart';
import 'package:atrueque/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const IndexPage(),
  '/login': (context) => const LoginScreen(),
  '/main': (context) => const MainPage(),
  '/home': (context) => const HomePage(),
  '/register': (context) => const RegisterScreen(),
  '/select-categories':(context) =>  const SelectCategoryPage()
};
