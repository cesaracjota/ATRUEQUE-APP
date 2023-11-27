import 'package:atrueque/routes/routes.dart';
import 'package:atrueque/ui/pages/404/not_found_page.dart';
import 'package:atrueque/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atrueque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryMaterialColor,
        primaryColor: primaryMaterialColor,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: appRoutes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
      },
    );
  }
}
