import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/Screen_details/screen_details.dart';
import 'package:chefskart/view/home/widget/boedercircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SelectDishes extends StatelessWidget {
  const SelectDishes({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    print(provider.dishList?.dishes.length ?? 0);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Select Dishes'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .06,
                  color: Colors.black,
                ),
                Card(
                  margin: EdgeInsets.only(
                      left: size.width * .060,
                      top: size.height * .030,
                      right: size.width * .060),
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    height: size.height * .09,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Wsize.size20,
                        SizedBox(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Select_date-01.svg',
                                height: size.height * .025,
                              ),
                              Wsize.size10,
                              const Text(
                                '21 May 2021',
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          thickness: .9,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Wsize.size20,
                              SvgPicture.asset(
                                'assets/images/Set_time-01.svg',
                                height: size.height * .025,
                              ),
                              Wsize.size10,
                              const Text(
                                '10:30 Pm-12:30 Pm',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Hsizes.size10,
            Container(
              color: Colors.white,
              height: size.height * .24,
              child: Column(
                children: [
                  Consumer<HomeProvider>(
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
                  ),
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
                  Flexible(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const BorderContainer(
                          color: Color(0xffFF941A),
                          width: 2,
                          child: BorderContainer(
                            width: 2,
                            color: Colors.white,
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/premium-photo/chicken-biriyani-using-jeera-rice-arranged-earthenware-with-raitha-grey-background_527904-8.jpg'),
                                child: Center(
                                  child: Text(
                                    'Biriyani',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                        );
                      },
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                        return Wsize.size10;
                      },
                    ),
                  ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                            const Text('Masala Muglai'),
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
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      '4.3',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/images/star.svg',
                                                      height:
                                                          size.height * .008,
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
                                                const Text(
                                                  'Refrigerator',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
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
                                                const Text(
                                                  'Refrigerator',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10),
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
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                Text(
                                                  'view list >',
                                                  style: TextStyle(
                                                      color: Color(0xffFF8800),
                                                      fontSize: 10),
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
                                              child: const Text(
                                                'Chicken fried in deep tomato sauce with \ndelicious spices',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Wsize.size20,
                                            Container(
                                              height: size.height / 8,
                                              width: size.width / 3.4,
                                              decoration: BoxDecoration(
                                                  color: Colors.cyan,
                                                  image: const DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        'https://img.freepik.com/premium-photo/chicken-biriyani-using-jeera-rice-arranged-earthenware-with-raitha-grey-background_527904-8.jpg'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor:
                                                      const Color(0xffFFFFFF),
                                                  side: const BorderSide(
                                                      color:
                                                          Color(0xffFF9A26))),
                                              onPressed: () {},
                                              child: Row(
                                                children: const [
                                                  Text(
                                                    'Add  +',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFF9A26)),
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
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: 20),
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
