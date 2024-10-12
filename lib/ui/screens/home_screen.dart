import 'package:flutter/material.dart';
import 'package:islamy/common/app_images.dart';
import 'package:islamy/ui/tabs/hadeeth_tab.dart';
import 'package:islamy/ui/tabs/quran_tab.dart';
import 'package:islamy/ui/tabs/radio_tab.dart';
import 'package:islamy/ui/tabs/sebha_tab.dart';
import 'package:islamy/ui/tabs/settings_tab.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(!Provider.of<ThemeProvider>(context).isDark
              ? AppImages.bgImage
              : AppImages.darkBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Islamy'),
        ),
        body: tabsList[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.quranIcon),
                ),
                label: 'quran'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.bookIcon),
                ),
                label: 'book'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.sebhaIcon),
                ),
                label: 'sebha'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.radioIcon),
                ),
                label: 'radio'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'settings'),
          ],
        ),
      ),
    );
  }
}
