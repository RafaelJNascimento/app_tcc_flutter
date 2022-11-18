import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tcc_app/provider/establishments.dart';
import 'package:tcc_app/services/auth_service.dart';
import 'package:tcc_app/views/auth_check.dart';
import 'firebase_options.dart';
import 'views/home.dart';
import 'util/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthService()),
        ChangeNotifierProvider(
          create: (ctx) => Establishments(),
        ),
      ],
      child: MaterialApp(
        title: 'APP TCC',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          AppRoutes.auth: (ctx) => const AuthCheck(),
          AppRoutes.home: (ctx) => const Home(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
