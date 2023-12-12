import 'package:chatgptclone/home.dart';
import 'package:chatgptclone/models/modules_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'userAuthentication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ModelsProvider())],
      child: MaterialApp(
        title: 'ChatGPT CLONE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
