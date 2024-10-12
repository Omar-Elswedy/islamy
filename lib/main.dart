import 'package:flutter/material.dart';
import 'package:islamy/common/app_theme.dart';
import 'package:islamy/providers/theme_provider.dart';
import 'package:islamy/ui/screens/hadeeth_screen.dart';
import 'package:islamy/ui/screens/home_screen.dart';
import 'package:islamy/ui/screens/quran_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranScreen.routeName: (_) => const QuranScreen(),
        HadeethScreen.routeName: (_) => const HadeethScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
