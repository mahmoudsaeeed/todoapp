import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/presentation/views/sreens/note_screen.dart';
import 'package:todo2/presentation/views/sreens/task_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  int selectedScreen = 0;

  List sreens = [
    const TaskScreen(),
    const NoteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
            BlocProvider<GetCategoriesCubit>(
              create: (context) => getIt<GetCategoriesCubit>()
            ),
            BlocProvider<GetTasksCubit>(
              create: (context) => getIt<GetTasksCubit>(),
            ),
          ],
      child: Scaffold(
        body: sreens.elementAt(selectedScreen),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedScreen,
          onTap: (indexChoosed) {
            setState(() {
              selectedScreen = indexChoosed;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.screen_lock_portrait_outlined),
              label: "Notes",
            ),
          ],
        ),
      ),
    );
  }
}
