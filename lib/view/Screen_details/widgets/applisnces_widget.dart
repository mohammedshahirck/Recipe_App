import 'package:chefskart/constants/constants.dart';
import 'package:flutter/material.dart';

class AppliancesWidget extends StatelessWidget {
  const AppliancesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${appliances[index]["image"]}'))),
              ),
              Text(appliances[index]["name"])
            ],
          ),
        );
      }).toList(),
    );
  }
}
