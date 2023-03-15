import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/auth_background.png'),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: const Image(
                    image: AssetImage('assets/images/house.png'),
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  height: 300,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: const Column(children: [
                    Form(child: Text('email')),
                    Form(
                      child: Text('password'),
                    ),
                    Text('SignUp'),
                    Text('Login instead')
                  ]),
                )
              ])),
    );
  }
}
