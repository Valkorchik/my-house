import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_house/screens/auth_screen.dart';
import 'package:my_house/screens/registr_screen.dart';
import 'package:my_house/screens/sign_in_screen.dart';
import 'screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/auth': (context) => const AuthPage(),
        '/auth/sign': (context) => const SignInPage(),
        '/auth/registr': (context) => const RegistrationScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
    );
  }
}
