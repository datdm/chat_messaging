import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 12),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          )
        ]
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: primrayColor),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2,
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: primrayColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type Message..."
                        )
                      )
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
                    ),
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}