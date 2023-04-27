import 'package:chefskart/controller/home/homea_provider.dart';
import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:chefskart/view/home/widget/boedercircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SelectDishes extends StatelessWidget {
  const SelectDishes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Select Dishes'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
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
                              .toList(),
                        );
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
              const Divider(
                thickness: 2,
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Wsize.size10,
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Recommended',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            Wsize.size10,
                            Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                    ),
                    Wsize.size100,
                    Wsize.size20,
                    ElevatedButton(
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
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  padding: const EdgeInsets.only(top: 360),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      height: 100,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Hsizes.size10;
                  },
                  itemCount: 10)
            ],
          ),
        ),
      ),
    );
  }
}
        // child: Stack(
        //   children: [
        //     ListView.separated(
        //         padding: const EdgeInsets.only(top: 360),
        //         itemBuilder: (context, index) {
        //           return Container(
        //             color: Colors.red,
        //             height: 150,
        //           );
        //         },
        //         separatorBuilder: (context, index) {
        //           return Hsizes.size10;
        //         },
        //         itemCount: 20),
        //     Container(
        //       color: Colors.white,
        //       height: 350,
        //       child: Stack(
        //         children: [
        //           const Positioned(
        //             left: 40,
        //             top: 150,
        //             child: Text(
        //               'Popular Dishes',
        //               style:
        //                   TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.only(
        //               top: 80,
        //             ),
        //             child: ListView.separated(
        //               padding: const EdgeInsets.only(
        //                 left: 30,
        //               ),
        //               scrollDirection: Axis.horizontal,
        //               itemBuilder: (context, index) {
        //                 return const BorderContainer(
        //                   color: Color(0xffFF941A),
        //                   width: 2,
        //                   child: BorderContainer(
        //                     width: 2,
        //                     color: Colors.white,
        //                     child: CircleAvatar(
        //                       radius: 30,
        //                     ),
        //                   ),
        //                 );
        //               },
        //               separatorBuilder: (BuildContext context, int index) {
        //                 return Wsize.size10;
        //               },
        //               itemCount: 20,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       width: double.infinity,
        //       height: size.height * .06,
        //       color: Colors.black,
        //     ),
        //     Card(
        //       margin: EdgeInsets.only(
        //           left: size.width * .060,
        //           top: size.height * .030,
        //           right: size.width * .060),
        //       child: Container(
        //         padding: const EdgeInsets.only(top: 15, bottom: 15),
        //         height: size.height * .09,
        //         width: size.width * .9,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Colors.white,
        //         ),
        //         child: Row(
        //           children: [
        //             Wsize.size20,
        //             SizedBox(
        //               child: Row(
        //                 children: [
        //                   SvgPicture.asset(
        //                     'assets/images/Select_date-01.svg',
        //                     height: size.height * .025,
        //                   ),
        //                   Wsize.size10,
        //                   const Text('21 May 2021'),
        //                 ],
        //               ),
        //             ),
        //             const VerticalDivider(
        //               thickness: .9,
        //               color: Colors.grey,
        //             ),
        //             Expanded(
        //               child: SizedBox(
        //                 child: Row(
        //                   children: [
        //                     Wsize.size20,
        //                     SvgPicture.asset(
        //                       'assets/images/Set_time-01.svg',
        //                       height: size.height * .025,
        //                     ),
        //                     Wsize.size10,
        //                     const Text('10:30 Pm-12:30 Pm'),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //         top: 300,
        //         child: Container(
        //           color: Colors.white,
        //           child: Row(
        //             children: [
        //               Wsize.size10,
        //               GestureDetector(
        //                 onTap: () {},
        //                 child: SizedBox(
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: const [
        //                       Text(
        //                         'Recommended',
        //                         style: TextStyle(
        //                             fontSize: 19, fontWeight: FontWeight.bold),
        //                       ),
        //                       Wsize.size10,
        //                       Icon(
        //                         Icons.arrow_drop_down,
        //                         size: 35,
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Wsize.size100,
        //               Wsize.size20,
        //               ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                   elevation: 5,
        //                   backgroundColor: Colors.black,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(10),
        //                   ),
        //                 ),
        //                 onPressed: () {},
        //                 child: const Text(
        //                   'Menu',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )),
        //   ],
        // ),
    
