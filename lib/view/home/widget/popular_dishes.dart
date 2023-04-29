import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/home/widget/boedercircle.dart';
import 'package:flutter/material.dart';

class PopularDishes extends StatelessWidget {
  const PopularDishes({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BorderContainer(
            color: const Color(0xffFF941A),
            width: 2,
            child: BorderContainer(
              width: 2,
              color: Colors.white,
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(provider.populardishes[index].image),
                  child: Center(
                    child: Text(
                      provider.populardishes[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          );
        },
        itemCount: provider.populardishes.length,
        separatorBuilder: (BuildContext context, int index) {
          return Wsize.size10;
        },
      ),
    );
  }
}
