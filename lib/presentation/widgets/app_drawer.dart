import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_house/presentation/bloc/auth/auth_bloc.dart';
import 'package:my_house/presentation/routes/router.gr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Мой дом'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                  onPressed: () {
                    context.router.replace(const AdvertsListRoute());
                  },
                  child: const Text(
                    'Объявления',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 6,
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
              TextButton(
                  onPressed: () {
                    context.router.replace(const MyAdvertsListRoute());
                  },
                  child: const Text(
                    'Моя недвижимость',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
              TextButton(
                  onPressed: () {
                    context.router.replace(const FaqRoute());
                  },
                  child: const Text(
                    'FAQ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context, listen: false)
                        .add(const LogoutEvent());
                    context.router.replace(const SplashRoute());
                  },
                  child: const Text(
                    'Выйти',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          )),
    );
  }
}
