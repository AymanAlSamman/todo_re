import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/tasks/widget/task_item_widget.dart';
import 'package:todo/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksView extends StatefulWidget {
  TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DateTime focusTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context);
    return Column(
      children: [
        Stack(
          alignment: const Alignment(0, 2.3),
          clipBehavior: Clip.none,
          children: [
            Container(
              color: vm.isDark() ? const Color(0xff5D9CEC) : theme.primaryColor,
              width: mediaQuery.width,
              height: mediaQuery.height * 0.2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Text(
                  lang!.todo,
                  style: vm.isDark()
                      ? theme.textTheme.titleLarge
                      : theme.textTheme.titleLarge
                          ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            EasyInfiniteDateTimeLine(
              locale: vm.currentLanguage,
              showTimelineHeader: false,
              firstDate: DateTime(2023),
              focusDate: focusTime,
              lastDate: DateTime(2050),
              timeLineProps: const EasyTimeLineProps(
                separatorPadding: 20,
              ),
              dayProps: EasyDayProps(
                height: 100,
                inactiveDayStyle: DayStyle(
                    dayNumStyle: vm.isDark()
                        ? theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)
                        : theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                    dayStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                    monthStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0xff141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    )),
                activeDayStyle: DayStyle(
                    dayNumStyle: vm.isDark()
                        ? theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)
                        : theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                    dayStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500),
                    monthStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0xff141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    )),
                todayStyle: DayStyle(
                    dayNumStyle: vm.isDark()
                        ? theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)
                        : theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                    dayStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                    monthStrStyle: vm.isDark()
                        ? theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)
                        : theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                    decoration: BoxDecoration(
                      color:
                          vm.isDark() ? const Color(0xff141922) : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: theme.primaryColor),
                    )),
              ),
              onDateChange: (selectedDate) {
                setState(() {
                  focusTime = selectedDate;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Expanded(
          child: ListView(
            children: [
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
              TaskItemWidget(),
            ],
          ),
        )
      ],
    );
  }
}
