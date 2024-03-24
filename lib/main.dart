import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/auth/auth_gate.dart';
import 'package:minimal_chat/auth/login_or_register.dart';
import 'package:minimal_chat/themes/light_mode.dart';
import 'package:minimal_chat/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDMveAFhv3DMM2KpFvYn6RyinY5la6uyQc",
      appId: "1:1070868654878:android:179e17504cf3e54d6eb70f",
      messagingSenderId: "1070868654878",
      projectId: "minimal-chat-ea915",
    ),
  );
  runApp(ChangeNotifierProvider(
    create: (Context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
