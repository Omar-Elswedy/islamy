import 'package:flutter/material.dart';
import 'package:islamy/common/app_theme.dart';
import 'package:islamy/ui/screens/home_screen.dart';
import 'package:islamy/ui/screens/quran_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranScreen.routeName: (_) => const QuranScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
