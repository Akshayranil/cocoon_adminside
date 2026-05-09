import 'package:flutter/material.dart';

Widget buildSidebarCard(String title, String value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: TextEditingController(text: value),
          readOnly: true,
          decoration: const InputDecoration(border: OutlineInputBorder()),
         
        ),
      ],
    ),
  );
}
