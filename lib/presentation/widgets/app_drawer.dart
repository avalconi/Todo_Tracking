import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/core/theme/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Drawer(
      child: Center(
        child: IconButton(
          onPressed: () => themeCubit.toggleTheme(),
          icon: Icon(
            Theme.of(context).brightness == .light
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),
      ),
    );
  }
}
