import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.email,
    required this.fullname,
  }) : super(key: key);
  
  final String email;
  final String fullname;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 2,
        vertical: defaultPadding,
      ),
      child: Column(
        children: [
          const Icon(Icons.account_circle, size: 80),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Fullname",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                widget.fullname,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}