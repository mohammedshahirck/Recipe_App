import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/controller/screen_details/screen_details.dart';
import 'package:chefskart/view/Screen_details/screen_details.dart';
import 'package:chefskart/view/home/selected_dishes.dart';
import 'package:chefskart/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: const SelectDishes(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenProvider(),
          child: const ScreenDetails(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
