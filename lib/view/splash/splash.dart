import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Provider.of<HomeProvider>(context, listen: false);
    splashController.splash(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ChefKart',
              style: TextStyle(fontSize: 28),
            )
          ],
        ),
      )),
    );
  }
}
