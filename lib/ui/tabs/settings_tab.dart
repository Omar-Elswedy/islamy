import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(
              AppLocalizations.of(context)!.darkTheme,
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
          ListTile(
            leading: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
              child: DropdownButton<String>(
                dropdownColor: Theme.of(context).colorScheme.primary,
                style: Theme.of(context).textTheme.titleSmall,
                icon: const Icon(Icons.menu),
                items: [
                  DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20),
                      )),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      'عربي',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.changeAppLocal(value);
                  }
                },
                value: themeProvider.appLocal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
