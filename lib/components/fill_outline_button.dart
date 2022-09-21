import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final bool isFilled;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          color: Colors.white,
        )
      ),
      onPressed: onPress,
      elevation: isFilled ? 2 : 0,
      color: isFilled ? Colors.white : Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? contentColorLightTheme : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}