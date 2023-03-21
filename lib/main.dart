import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/domain/repositories/auth_repository.dart';
import 'package:my_house/presentation/routes/router.gr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}

class App extends StatelessWidget {
  static final _appRouter = AppRouter();

  const App({super.key});

  Future<bool> _autoLogin() async {
    final auth = await AuthRepository().tryAutoLogin();
    return auth;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthRepository>.value(
          value: AuthRepository(),
        ),
      ],
      child: FutureBuilder(
          future: _autoLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return MaterialApp.router(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
              ],
              locale: const Locale('ru'),
              debugShowCheckedModeBanner: false,
              routerDelegate: _appRouter.delegate(
                initialRoutes: [
                  if (snapshot.data!) const AdvertsListRoute(),
                  if (!snapshot.data!) const SplashRoute(),
                ],
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              title: 'My House',
              theme: ThemeData(
                textTheme: GoogleFonts.interTextTheme(),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
              ),
            );
          }),
    );
  }
}
