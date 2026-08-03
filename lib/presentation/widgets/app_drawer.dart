import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_flutter/core/theme/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              child: Lottie.asset('assets/animation/todo.json'),
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          IconButton(
            onPressed: () => themeCubit.toggleTheme(),
            icon: Icon(
              Theme.of(context).brightness == .light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
