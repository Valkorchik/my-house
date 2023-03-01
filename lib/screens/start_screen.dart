import 'package:flutter/material.dart';
import 'package:my_house/screens/components/rounded_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/start_background.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
              const Text(
                'Добрый день!\n\n',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Text(
                'К вашему вниманию предоставляется первый мобильный агрегатор по управлению и покупке недвижимости. ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundedButton(title: "Присоединяйтесь!", button: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
