import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/home/widget/choice_chip.dart';
import 'package:chefskart/view/home/widget/date_time_card.dart';
import 'package:chefskart/view/home/widget/dish_card.dart';
import 'package:chefskart/view/home/widget/popular_dishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SelectDishes extends StatelessWidget {
  const SelectDishes({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).loaddata();
    });
    final provider = Provider.of<HomeProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Select Dishes'),
      ),
      body: provider.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * .06,
                        color: Colors.black,
                      ),
                      DateTimeCard(size: size),
                    ],
                  ),
                  Hsizes.size10,
                  Container(
                    color: Colors.white,
                    height: size.height * .24,
                    child: Column(
                      children: [
                        const ChoiceChips(),
                        Hsizes.size20,
                        Row(
                          children: const [
                            Wsize.size20,
                            Text(
                              'Popular Dishes',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        PopularDishes(provider: provider),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Recommended',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Wsize.size10,
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: size.width / 4.5,
                                  height: size.height / 25,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Menu',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Hsizes.size20,
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return DishCard(index: index);
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: provider.recipe.length),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        label: Row(
          children: [
            SvgPicture.asset('assets/images/Group 377.svg'),
            Wsize.size10,
            Text('3 food items selected',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
            Wsize.size10,
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
