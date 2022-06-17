import 'package:flutter/material.dart';
import 'dart:math';

class ChoiceItem {
  final int id;
  final TextEditingController controller;
  final String text;

  ChoiceItem({
    @required this.id,
    @required this.text,
    @required this.controller,
  });

  factory ChoiceItem.create(String text) {
    return ChoiceItem(
      id: Random().nextInt(99999),
      text: text,
      controller: TextEditingController(text: text),
    );
  }

  ChoiceItem change(String text) {
    return ChoiceItem(
      id: this.id,
      text: text,
      controller: this.controller,
    );
  }

  void dispose() {
    controller.dispose();
  }

  @override
  String toString() {
    return text;
  }
}
