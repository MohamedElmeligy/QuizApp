import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import './app_theme_data.dart';

import './auth.dart';

import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';


//This is an example

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(
            create: (ctx) => Auth(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth _authProvider = Provider.of<Auth>(context, listen: false);

    Future<void> init() async {
      // Provider.of<Navigation>(context, listen: false).selectPageStatic(0);
      // await Provider.of<ProfileProvider>(context, listen: false).update();
      // await PaymentService.init();
    }

    return MaterialApp(
      theme: appThemeData,
      home: StreamBuilder<auth.User>(
        stream: _authProvider.onAuthStateChanged,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return SplashScreen();
          else if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
            return FutureBuilder<void>(
                future: init(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return SplashScreen();
                  else {
                    return HomeScreen();
                  }
                });
          } else {
            return AuthScreen();
          }
        },
      ),
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
