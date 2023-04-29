import 'package:chefskart/constants/constants.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/Screen_details/widgets/appbar_content.dart';
import 'package:chefskart/view/Screen_details/widgets/applisnces_widget.dart';
import 'package:chefskart/view/Screen_details/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            //  Appbar With Stack widgets
            AppbarContent(size: size),
            Container(
              margin: const EdgeInsets.all(20),
              width: size.width / 1,
              height: 1.5,
              color: Colors.grey.shade400,
            ),
            IngrediantsWidget(
              list: veg,
              title: 'Vegetables (0${veg.length})',
            ),
            IngrediantsWidget(list: spices, title: 'Spices(0${spices.length})'),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Appliances',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Hsizes.size20,
            const AppliancesWidget(),
            Hsizes.size20,
          ],
        ),
      )),
    );
  }
}
