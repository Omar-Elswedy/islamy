import 'package:flutter/material.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(
              'Dark Theme',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20),
            ),
            value: themeProvider.isDark,
            activeColor: AppColors.gold,
            onChanged: (value) {
              themeProvider
                  .changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
        ],
      ),
    );
  }
}
