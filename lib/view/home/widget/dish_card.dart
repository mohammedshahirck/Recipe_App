import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/Screen_details/screen_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DishCard extends StatelessWidget {
  const DishCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ScreenDetails();
            },
          ),
        );
      },
      child: SizedBox(
        height: size.height / 6.7,
        child: Row(
          children: [
            Container(
              height: size.height / 6.7,
              width: size.width / 1.9777,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(provider.recipe[index].name),
                      Wsize.size20,
                      SvgPicture.asset(
                        'assets/images/Group 359.svg',
                        height: size.height * .020,
                      ),
                      Wsize.size20,
                      Container(
                        height: size.height * .020,
                        width: size.width * .08,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                provider.recipe[index].rating.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                height: size.height * .008,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Hsizes.size10,
                  Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/refrigerator.svg',
                            height: size.height * .025,
                          ),
                          Text(
                            provider.recipe[0].equipments[0].toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      Wsize.size10,
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/refrigerator.svg',
                            height: size.height * .025,
                          ),
                          Text(
                            provider.recipe[0].equipments[1].toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      Wsize.size10,
                      Container(
                        color: Colors.grey.shade200,
                        height: size.height * .035,
                        width: size.width * .004,
                      ),
                      Wsize.size12,
                      Column(
                        children: const [
                          Text(
                            'Ingredients',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            'view list >',
                            style: TextStyle(
                                color: Color(0xffFF8800), fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  Hsizes.size10,
                  Row(
                    children: [
                      SizedBox(
                        height: size.height / 26,
                        width: size.width / 2,
                        child: Text(
                          provider.recipe[index].description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: size.height / 6.7,
                  width: size.width / 2.403,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Wsize.size20,
                      Container(
                        height: size.height / 8,
                        width: size.width / 3.4,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  provider.recipe[index].image.toString()),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: size.height * .024,
                  bottom: 1,
                  child: SizedBox(
                    height: 30,
                    width: 75,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0xffFFFFFF),
                            side: const BorderSide(color: Color(0xffFF9A26))),
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              'Add  +',
                              style: TextStyle(color: Color(0xffFF9A26)),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
