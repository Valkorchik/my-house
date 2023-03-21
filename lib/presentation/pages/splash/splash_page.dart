import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_house/presentation/widgets/rounded_button.dart';
import 'package:my_house/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Починить верстку
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/start_background.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image(
                  image: AssetImage("assets/images/house.png"),
                  height: 150,
                ),
              ),
              Text(
                'Мой дом\n\n',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Покупай и управляй.',
                      textStyle: const TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      speed: const Duration(milliseconds: 150),
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 500),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundedButton(
                  title: "Присоединяйтесь!",
                  button: () => context.router.replace(
                    const AuthRoute(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
