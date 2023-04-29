import 'package:chefskart/helpers/ksizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
