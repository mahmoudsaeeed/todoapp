import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/presentation/widgets/custom_text_form_field.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/add_task/add_task_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/features/task/presenter/view/widgets/add_task/add_task_category_widget.dart';
import 'package:todo2/features/task/presenter/view/widgets/add_task/add_task_date_widget.dart';

import 'package:uuid/uuid.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late TextEditingController taskNameController,
      taskDateController,
      taskCategoryController;
  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
    taskCategoryController = TextEditingController(text: defaultCategory.name);
    taskDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) async {
        if (state is AddTaskSuccess) {
          // ! refresh tasks in home page
          //? showDialog is a dialog for alarm user with success added
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              title: const Text("Task Added successfully"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                    // style: ButtonsStyle.buttonInDialog,
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        (route) => route.isFirst,
                      );
                    },
                    child: const Text("Ok"))
              ],
            ),
          );
          if (context.mounted) {
            BlocProvider.of<GetTasksCubit>(context).getFilteredData(
                categoryName: taskCategoryController.text.trim());
            if (Navigator.canPop(context)) {
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          }
        } else if (state is AddTaskFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to add task")),
          );
        }
      },
      child: AlertDialog(
        title: Text(
          "Add Task",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: double.maxFinite, // مهم علشان تمنع overflow
          child: ListView(
            shrinkWrap: true, // مهم جدًا علشان المكون ياخد أقل حجم ممكن
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              CustomTextFormField(
                decoration: const InputDecoration(
                  label: Text("Enter Task name"),
                ),
                controller: taskNameController,
              ),
              AddTaskCategoryWidget(
                taskCategoryController: taskCategoryController,
              ),
              AddTaskDateWidget(
                taskDateController: taskDateController,
              ),
              ElevatedButton(
                // style: ButtonsStyle.buttonInDialog,
                onPressed: () {
                  final cubit = context.read<AddTaskCubit>();
                  TaskModel newTask = _buildTask();
                  cubit.addTask(newTask);

                  ///? when added happened ,
                  ///? the BlocConsumer in the top of file will refresh the tasks and redirect to home
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TaskModel _buildTask() {
    final uuid = const Uuid().v4();
    TaskModel newTask = TaskModel(
      id: uuid,
      title: taskNameController.text.trim(),
      createdAt: DateTime.now().toIso8601String(),
      categoryName: taskCategoryController.text,
      dueDate: taskDateController.text.trim(),
      isCompleted: false,
    );
    return newTask;
  }
}
