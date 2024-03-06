import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/login/login_view.dart';
import 'package:todo/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  List<String> languageList = ["English", "عربي"];
  List<String> themeModeList = ["Dark", "Light"];

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          color: vm.isDark() ? const Color(0xff5D9CEC) : theme.primaryColor,
          width: mediaQuery.width,
          height: mediaQuery.height * 0.2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Text(
              lang!.settings,
              style: vm.isDark()
                  ? theme.textTheme.titleLarge?.copyWith(color: Colors.black)
                  : theme.textTheme.titleLarge,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ********* Language **********
              Text(
                lang.language,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              CustomDropdown(
                items: languageList,
                initialItem: vm.currentLanguage == "en" ? "English" : "عربي",
                onChanged: (value) {
                  if (value == 'English') {
                    vm.changeLanguage('en');
                  } else if (value == "عربي") {
                    vm.changeLanguage('ar');
                  }
                },
                decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.circular(4.0),
                    expandedBorderRadius: BorderRadius.circular(4.0),
                    closedBorder: Border.all(color: theme.primaryColor),
                    expandedBorder: Border.all(color: theme.primaryColor),
                    closedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    expandedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ? theme.primaryColor : Colors.black,
                    ),
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: vm.isDark() ? theme.primaryColor : Colors.black,
                    )),
              ),

              const SizedBox(height: 25),

              // ********* Theme Mode **********
              Text(
                lang.theme,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              CustomDropdown(
                items: themeModeList,
                initialItem: vm.isDark() ? "Dark" : "Light",
                onChanged: (value) {
                  if (value == "Dark") {
                    vm.changeTheme(ThemeMode.dark);
                  } else if (value == "Light") {
                    vm.changeTheme(ThemeMode.light);
                  }
                },
                decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.circular(4.0),
                    expandedBorderRadius: BorderRadius.circular(4.0),
                    closedBorder: Border.all(color: theme.primaryColor),
                    expandedBorder: Border.all(color: theme.primaryColor),
                    closedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    expandedFillColor:
                        vm.isDark() ? const Color(0xff141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ? theme.primaryColor : Colors.black,
                    ),
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: vm.isDark() ? theme.primaryColor : Colors.black,
                    )),
              ),

              const SizedBox(height: 60),

              // **** Logout ****
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginView.routeName, (route) => false);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Logout",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.logout)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
