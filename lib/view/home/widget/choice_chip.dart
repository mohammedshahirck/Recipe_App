import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoiceChips extends StatelessWidget {
  const ChoiceChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Wrap(
            children: provider.choices
                .map(
                  (choice) => InkWell(
                    onTap: () {
                      provider.selectChoice(choice);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(6),
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: choice.isSelected
                              ? const Color(0xffFFF9F2)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: choice.isSelected
                                  ? Colors.amber
                                  : Colors.grey,
                              width: 1),
                        ),
                        child: SizedBox(
                          height: 25,
                          child: Center(
                              child: Text(
                            choice.name,
                            style: TextStyle(
                                color: choice.isSelected
                                    ? Colors.amber
                                    : Colors.grey,
                                fontWeight: choice.isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                        )),
                  ),
                )
                .toList());
      },
    );
  }
}
