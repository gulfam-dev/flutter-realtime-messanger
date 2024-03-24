import 'package:flutter/material.dart';
import 'package:minimal_chat/Constants/my_button.dart';
import 'package:minimal_chat/Constants/my_textfield.dart';
import 'package:minimal_chat/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  void login(BuildContext context) async {
    final authSerivce = AuthService();

    try {
      await authSerivce.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Welcome back, you\'ve been missed!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            focusNode: null,
            hintText: 'Email',
            obscureText: false,
            controller: _emailController,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextField(
            focusNode: null,
            hintText: 'Password',
            obscureText: true,
            controller: _pwController,
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
            text: 'Login',
            onTap: () => login(context),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not a member?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Register Now',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
