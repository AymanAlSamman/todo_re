import 'package:flutter/material.dart';
import 'package:todo/features/settings/settings_view.dart';
import 'package:todo/features/tasks/page/task_view.dart';

class SettingsProvider extends ChangeNotifier {
  int currentIndex = 0;
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;
  DateTime selectedDate = DateTime.now();

  selectTaskDate(BuildContext context) async {
    var currentSelectedDate = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (currentSelectedDate == null) return;
    selectedDate = currentSelectedDate;
    notifyListeners();
  }

  List<Widget> screens = [
    TasksView(),
    SettingsView(),
  ];

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
