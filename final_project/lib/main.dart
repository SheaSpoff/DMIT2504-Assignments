import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/favorites_screen.dart';
import 'firebase_options.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destination Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), 
        '/favorites': (context) => FavoritesScreen(), 
      },
    );
  }
}
