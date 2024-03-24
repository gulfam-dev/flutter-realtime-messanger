import 'package:flutter/material.dart';
import 'package:minimal_chat/Constants/my_button.dart';
import 'package:minimal_chat/Constants/my_textfield.dart';
import 'package:minimal_chat/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();
  final void Function()? onTap;

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Passwords do not match!'),
          ));

    }
  }

  RegisterPage({super.key, required this.onTap});

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
            'Let\'s create an account for you',
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
            height: 10,
          ),
          MyTextField(
            focusNode: null,
            hintText: 'Confirm Password',
            obscureText: true,
            controller: _confirmpwController,
          ),
          SizedBox(
            height: 25,
          ),
          MyButton(
            text: 'Register',
            onTap: () => register(context),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already a member?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Login Now',
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
