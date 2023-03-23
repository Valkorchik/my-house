import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/domain/entities/estate.dart';
import 'package:my_house/domain/repositories/auth_repository.dart';
import 'package:my_house/presentation/bloc/auth/auth_bloc.dart';
import 'package:my_house/presentation/bloc/estate/estate_bloc.dart';
import 'package:my_house/presentation/routes/router.gr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}

class App extends StatefulWidget {
  static final _appRouter = AppRouter();

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<bool> _autoLogin() async {
    final auth = await AuthRepository().tryAutoLogin();
    return auth;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(AuthRepository()),
          ),
          BlocProvider(
            create: (context) => EstateBloc(
              EstateList(),
            ),
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLogout) {
              setState(() {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      'Token expired',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text('Пожалуйста перезайдите.'),
                    actions: <Widget>[
                      TextButton(
                        child:
                            const Text('Хорошо', textAlign: TextAlign.center),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              });
            }
          },
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
                  routerDelegate: App._appRouter.delegate(
                    initialRoutes: [
                      if (snapshot.data!) const AdvertsListRoute(),
                      if (!snapshot.data!) const SplashRoute(),
                    ],
                  ),
                  routeInformationParser: App._appRouter.defaultRouteParser(),
                  title: 'My House',
                  theme: ThemeData(
                    textTheme: GoogleFonts.interTextTheme(),
                    colorScheme:
                        ColorScheme.fromSwatch(primarySwatch: Colors.red),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
