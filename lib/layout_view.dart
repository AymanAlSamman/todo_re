import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/task_bottom_sheet.dart';
import 'package:todo/settings_provider.dart';

class LayoutView extends StatelessWidget {
  static const String routeName = 'Layout';

  LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: vm.screens[vm.currentIndex],

      extendBody: true,
      //******* floating Action Button **********
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const TaskBottomSheet(),
          );

          // var data = TaskModel(title: "Play basketball",
          //     description: "10:15 AM",
          //     isDone: false,
          //     dateTime: DateTime.now(),);
          //
          // FirebaseUtils().addANewTask(data);
        },
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),

      // ********* bottom Navigation Bar ***********
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
