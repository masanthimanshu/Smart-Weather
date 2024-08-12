import 'package:flutter/material.dart';

final actionButtonStyle = ButtonStyle(
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  )),
  iconSize: const WidgetStatePropertyAll(30),
  iconColor: const WidgetStatePropertyAll(Colors.white),
  padding: const WidgetStatePropertyAll(EdgeInsets.all(15)),
  backgroundColor: const WidgetStatePropertyAll(Colors.teal),
);
