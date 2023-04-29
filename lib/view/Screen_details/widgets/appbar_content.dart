import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 2.9,
          color: Colors.white,
        ),
        Positioned(
          right: -20,
          bottom: 60,
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFFF9F2),
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          child: Container(
            width: size.width / 1,
            height: 2,
            color: Colors.grey.shade200,
          ),
        ),
        Positioned(
          right: -139,
          bottom: 21,
          child: Container(
            height: 180,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Mask Group 17@2x.png'))),
          ),
        ),
        Positioned(
          bottom: -16,
          right: -90,
          child: Container(
            height: 265,
            width: 160,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'assets/images/pngtree-herbal-ingredients-transparent-image-png-image_3206949-removebg-preview@2x.png'))),
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          child: SizedBox(
            height: size.height / 4,
            width: size.width / 1.495,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Mashala Muglai',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Wsize.size12,
                    Container(
                      height: size.height * .020,
                      width: size.width * .08,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            '4.3',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SvgPicture.asset(
                            'assets/images/star.svg',
                            height: size.height * .008,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Mughlai masala is a style of cookery developed\nin the indian subcontinent by\nthe imperial kitchens of the Mughlai Empire .',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Hsizes.size20,
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Group 393.svg',
                      height: 20,
                    ),
                    Wsize.size10,
                    const Text('1 hour')
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Incrediants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'For 2 Peoples',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
