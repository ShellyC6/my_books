import 'package:books/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: TextButton(
                onPressed: ()=> context.goNamed(AppRouteName.bookshelf),
                child: const Text("Login and go to bookshelf"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}