import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/services/snack_bar_service.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel taskModel;

  const TaskItemWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFE4A49),
        borderRadius: BorderRadius.circular(15.5),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          dragDismissible: false,
          extentRatio: 0.265,
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            FirebaseUtils().deleteTask(taskModel).then((value) {
              EasyLoading.dismiss();
              SnackBarService.showSuccessMessage('Task deleted successfully');
            });
          }),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                EasyLoading.show();
                FirebaseUtils().deleteTask(taskModel);
                EasyLoading.dismiss();
                SnackBarService.showSuccessMessage('Task deleted successfully');
              },
              backgroundColor: const Color(0xFFFE4A49),
              borderRadius: BorderRadius.circular(15.5),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          width: mediaQuery.width,
          height: 115,
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
                    color: taskModel.isDone
                        ? const Color(0xff61E757)
                        : theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),

              const SizedBox(width: 20),

              //**** Title & Description ****
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //**** Title ****
                    Text(
                      taskModel.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      taskModel.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 10,
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

                    //**** Description ****
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.alarm,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat.yMMMMd().format(vm.selectedDate),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: vm.isDark() ? Colors.white : Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              if (taskModel.isDone)
                Text(
                  "Done !",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: const Color(0xff61E757),
                  ),
                ),
              if (!taskModel.isDone)
                // **** Check ****
                InkWell(
                  onTap: () {
                    EasyLoading.show();
                    var data = TaskModel(
                        id: taskModel.id,
                        title: taskModel.title,
                        description: taskModel.description,
                        isDone: true,
                        dateTime: taskModel.dateTime);
                    FirebaseUtils().updateTask(data).then((value) {
                      EasyLoading.dismiss();
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 65,
                    decoration: BoxDecoration(
                      color: taskModel.isDone
                          ? const Color(0xff61E757)
                          : theme.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 38,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
