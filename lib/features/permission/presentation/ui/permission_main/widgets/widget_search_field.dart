import 'package:flutter/material.dart';

Widget searchfield() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search...',
      suffixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
