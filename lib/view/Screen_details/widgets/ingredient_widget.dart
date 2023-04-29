import 'package:flutter/material.dart';

class IngrediantsWidget extends StatelessWidget {
  const IngrediantsWidget({
    super.key,
    required this.list,
    required this.title,
  });

  final List list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        collapsedBackgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(Icons.arrow_drop_down, size: 30, color: Colors.black)
          ],
        ),
        trailing: const SizedBox(),
        children: List.generate(list.length, (index) {
          return ListTile(
            title: Text(
              list[index]["name"],
            ),
            trailing: Text(
              list[index]["quantity"],
            ),
          );
        }).toList(),
      ),
    );
  }
}
