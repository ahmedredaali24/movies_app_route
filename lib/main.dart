import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/provider.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';
import 'my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCjVcjhBLYx3fxWgV_JSFqNKOYNAhnPKmw",
      appId: "1:367455978362:android:2832c2a11dd7e1c0be0cc3",
      messagingSenderId: "367455978362",
      projectId: "new-moveies",
      storageBucket: "new-moveies.appspot.com",
    ),
  );
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.enableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => WatchListProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      theme: MyTheme.themeMode,
    );
  }
}
