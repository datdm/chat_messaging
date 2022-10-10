import 'package:chat_messsaging/models/ChatMessage.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({
    Key? key,
    required this.message
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 0.75,
        vertical: defaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        color: primrayColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.play_arrow, color: message.isSender ? Colors.white : primrayColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 2,
                    color: message.isSender ? Colors.white : primrayColor.withOpacity(0.4),
                    width: double.infinity,
                  ),
                  Positioned(
                    left : 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: message.isSender ? Colors.white : primrayColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ]
              ),
            )
          ),
          Text(
            "0.37",
            style: TextStyle(
              fontSize: 12,
              color: message.isSender ? Colors.white : null,
            ),
          )
        ],
      ),
    );
  }
}