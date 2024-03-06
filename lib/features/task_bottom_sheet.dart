import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/services/snack_bar_service.dart';
import 'package:todo/core/utils/extract_data.dart';
import 'package:todo/core/widget/custom_text_field.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/settings_provider.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var mediaQueryData = MediaQuery.of(context);
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Form(
        key: formKey,
        child: Container(
          width: mediaQuery.width,
          height: mediaQuery.height * 0.6,
          decoration: BoxDecoration(
            color: vm.isDark() ? const Color(0xff141922) : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add a new task',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: vm.isDark() ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: titleController,
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'You must enter the task title';
                    }
                    return null;
                  },
                  hint: "Enter your task title",
                  hintColor: Colors.grey.shade600,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: descriptionController,
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'You must enter the task description';
                    }
                    return null;
                  },
                  hint: "Enter your task description",
                  hintColor: Colors.grey.shade600,
                  maxLines: 3,
                  maxLength: 150,
                ),

                const SizedBox(
                  height: 10,
                ),

                // select time
                Text(
                  'Select time',
                  textAlign: TextAlign.start,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: vm.isDark() ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                // date
                TextButton(
                  onPressed: () {
                    vm.selectTaskDate(context);
                  },
                  child: Text(
                    DateFormat.yMMMMd().format(vm.selectedDate),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: vm.isDark() ? Colors.white : Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var data = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        isDone: false,
                        dateTime: extractDateTime(vm.selectedDate),
                      );
                      EasyLoading.show();
                      FirebaseUtils().addANewTask(data).then((value) {
                        EasyLoading.dismiss();
                        Navigator.pop(context);
                        SnackBarService.showSuccessMessage(
                            'Task successfully created');
                      }).onError((error, stackTrace) {
                        EasyLoading.dismiss();
                      });
                    }
                  },
                  child: Text(
                    'Add task',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
