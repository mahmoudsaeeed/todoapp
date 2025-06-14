import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/presentation/view_model/cubit/theme_cubit.dart';

import '../../../features/category/presenter/view/widgets/category_part_widget.dart';
import '../../../features/task/presenter/view/widgets/tasks_part_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late bool isDark;
  @override
  void initState() {
    super.initState();
    final themeStored = context.read<ThemeCubit>();
    isDark =  themeStored.state == ThemeMode.dark ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Tasks",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            Switch(
              thumbIcon: const WidgetStatePropertyAll(Icon(Icons.dark_mode)),
              value: isDark,
              onChanged: (newTheme) {
                final cubit = context.read<ThemeCubit>();
                cubit.changeTheme(
                    newTheme ? ThemeModeOption.dark : ThemeModeOption.light);

                log("isDark ? $newTheme");
                setState(() {
                  isDark = newTheme;
                });
              },
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Pages.categoryScreen  );
                },
                icon: const Icon(Icons.format_list_bulleted_sharp))
          ],
        ),
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: const Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: CategoryPartWidget(),
                      ),
        
                      // Divider(
                      //   endIndent: 10,
                      //   indent: 10,
                      //   color: Colors.black,
                      // ),
        
                      Positioned.fill(
                        top: 120,
                        child: TasksPartWidget(),
                      )
                    ],
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
