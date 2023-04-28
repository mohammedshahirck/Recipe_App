import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height / 3,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [],
                  ),
                ),
                Positioned(
                  right: -15,
                  bottom: -1,
                  child: Container(
                    height: 192,
                    width: 192,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFF9F2),
                    ),
                  ),
                ),
              ],
            ),
            Hsizes.size10,
            Container(
              height: size.height / 1.5,
              color: Colors.red,
            )
          ],
        ),
      )),
    );
  }
}
