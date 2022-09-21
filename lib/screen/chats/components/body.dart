import 'package:chat_messsaging/components/fill_outline_button.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, defaultPadding),
      color: primrayColor,
      child: Row(
        children: [
          FillOutlineButton(text: "Recent Message", onPress: () {}),
          const SizedBox(width: defaultPadding / 2),
          FillOutlineButton(text: "Active", onPress: () {}, isFilled: false)
        ],
      ),
    );
  }
}