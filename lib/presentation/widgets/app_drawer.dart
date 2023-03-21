import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_house/presentation/bloc/cubit/auth_cubit.dart';
import 'package:my_house/presentation/routes/router.gr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Hello user!'),
          ),
          body: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context, listen: false).logout();
              },
              child: const Text('log out'))),
    );
  }
}
