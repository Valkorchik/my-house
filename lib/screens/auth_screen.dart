import 'package:flutter/material.dart';
import 'package:my_house/models/components/rounded_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            image: DecorationImage(
                image: AssetImage('assets/images/auth_background.png'),
                fit: BoxFit.cover)),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/house.png"),
                        height: 150,
                      ),
                      Text(
                        "Мой Дом",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RoundedButton(
                          title: "Войти",
                          button: () =>
                              Navigator.pushNamed(context, '/auth/sign')),
                      RoundedButton(
                          title: "Регистрация",
                          button: () =>
                              Navigator.pushNamed(context, '/auth/registr')),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
