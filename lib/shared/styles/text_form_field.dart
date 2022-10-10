import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.black,
  ),
  floatingLabelStyle: TextStyle(
    color: primrayColor,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    )
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primrayColor,
    )
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    )
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    )
  )
);
