import 'package:flutter/material.dart';

Widget textButton({required String text, required color,required VoidCallback function}) => TextButton(
  onPressed: function,
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color),
  ),
  child: Text(
    text,
    style: const TextStyle(color: Colors.white),
  ),
);