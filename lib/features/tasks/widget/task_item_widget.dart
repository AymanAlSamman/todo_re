import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context);
    return Container(
      width: mediaQuery.width,
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: vm.isDark() ? const Color(0xff141922) : Colors.white,
        borderRadius: BorderRadius.circular(15.5),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 70,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),

          const SizedBox(width: 20),

          //**** Title & Description ****
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //**** Title ****
              Text(
                'Play basket ball',
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              //**** Description ****
              const Row(
                children: [
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 5,
                  ),
                  Text('10:30 AM'),
                ],
              ),
            ],
          ),

          Spacer(),

          // **** Check ****
          Container(
            height: 45,
            width: 65,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Icon(
              Icons.check,
              size: 38,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
