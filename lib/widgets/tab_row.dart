import 'package:flutter/material.dart';
import 'package:food_wheels/screens/chatscreen.dart';
import 'package:food_wheels/screens/paymentdetails.dart';

import 'package:sizer/sizer.dart';

import '../screens/category_screen.dart';

class TabRow extends StatelessWidget {
  const TabRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 6.0.h,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TabButtons(
                  text: 'Payment',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreditCardPage()),
                    );
                  },
                ),
                SizedBox(
                  width: 2.0.h,
                ),
                TabButtons(
                  text: 'Category',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TabButtons extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TabButtons({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
