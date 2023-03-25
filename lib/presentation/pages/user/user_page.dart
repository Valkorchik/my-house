// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../widgets/app_drawer.dart';

enum ChangeMode {
  None,
  Username,
  Password,
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  ChangeMode _changeMode = ChangeMode.None;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;
  AnimationController? _controller;

  final Map<String, String> _userData = {
    'password': '',
    'username': '',
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _submit() {
    //TODO: Подключить сабмит
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (_changeMode == ChangeMode.Username) {
      // Save new username
    } else {
      // Save new Password
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личный кабинет'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn1.iconfinder.com/data/icons/business-users/512/circle-1024.png',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Почта',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _changeMode = ChangeMode.Username;
                        _controller!.forward();
                      });
                    },
                    child: const Text(
                      'Сменить имя пользователя',
                      style: TextStyle(fontSize: 16),
                    )),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      AnimatedContainer(
                        constraints: BoxConstraints(
                          minHeight:
                              _changeMode == ChangeMode.Username ? 60 : 0,
                          maxHeight:
                              _changeMode == ChangeMode.Username ? 120 : 0,
                        ),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        child: FadeTransition(
                          opacity: _opacityAnimation!,
                          child: SlideTransition(
                            position: _slideAnimation!,
                            child: TextFormField(
                              enabled: _changeMode == ChangeMode.Username,
                              decoration: const InputDecoration(
                                  labelText: 'Имя пользователя'),
                              validator: _changeMode == ChangeMode.Username
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Введите имя!';
                                      }
                                      return null;
                                    }
                                  : null,
                              onSaved: (value) {
                                _userData['username'] = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _changeMode = ChangeMode.Password;
                              _controller!.forward();
                            });
                          },
                          child: const Text(
                            'Сменить пароль',
                            style: TextStyle(fontSize: 16),
                          )),
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                constraints: BoxConstraints(
                                  minHeight: _changeMode == ChangeMode.Password
                                      ? 60
                                      : 0,
                                  maxHeight: _changeMode == ChangeMode.Password
                                      ? 120
                                      : 0,
                                ),
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                child: FadeTransition(
                                  opacity: _opacityAnimation!,
                                  child: SlideTransition(
                                    position: _slideAnimation!,
                                    child: TextFormField(
                                      enabled:
                                          _changeMode == ChangeMode.Password,
                                      decoration: const InputDecoration(
                                          labelText: 'Пароль'),
                                      validator:
                                          _changeMode == ChangeMode.Password
                                              ? (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Введите имя!';
                                                  }
                                                  return null;
                                                }
                                              : null,
                                      onSaved: (value) {
                                        _userData['password'] = value!;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Выйти',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ]),
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
