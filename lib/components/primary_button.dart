import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = primrayColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onPress;
  final color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      color: color,
      onPressed: onPress,
      minWidth: double.infinity,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}