import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_app/services/auth_service.dart';
import 'package:tcc_app/views/home.dart';
import 'login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return auth.usuario == null ? const LoginPage() : const Home();
  }
}
