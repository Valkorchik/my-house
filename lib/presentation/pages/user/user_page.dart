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

class _UserPageState extends State<UserPage> {
  final GlobalKey<FormState> _formUserKey = GlobalKey();
  ChangeMode _changeMode = ChangeMode.None;

  final Map<String, String> _userData = {
    'password': '',
    'username': '',
  };

  void _submit() {
    if (!_formUserKey.currentState!.validate()) {
      return;
    }
    _formUserKey.currentState!.save();
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
                          'https://banner2.cleanpng.com/20180823/owi/kisspng-computer-icons-user-vector-graphics-portable-netwo-male-user-svg-png-icon-free-download-34728-on-5b7f4c547b5841.6360734715350692685052.jpg',
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
                Form(
                  key: _formUserKey,
                  child: Column(
                    children: [
                      TextFormField(
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
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Пароль'),
                        validator: _changeMode == ChangeMode.Password
                            ? (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return 'Пароль слишком короткий!';
                                }
                                return null;
                              }
                            : null,
                        onSaved: (value) {
                          _userData['password'] = value!;
                        },
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _changeMode = ChangeMode.Username;
                        _submit();
                      });
                    },
                    child: const Text(
                      'Сменить имя пользователя',
                      style: TextStyle(fontSize: 16),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _changeMode = ChangeMode.Password;
                        _submit();
                      });
                    },
                    child: const Text(
                      'Сменить пароль',
                      style: TextStyle(fontSize: 16),
                    )),
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
      ),
    );
  }
}
