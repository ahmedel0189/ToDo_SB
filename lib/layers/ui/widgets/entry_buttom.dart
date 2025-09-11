import 'package:flutter/material.dart';

class EntryButtom extends StatelessWidget {
  final String entryButtomtext;
  final VoidCallback onPressed;
  const EntryButtom({
    super.key,
    required this.entryButtomtext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Colors.white, // لون الخلفية
        foregroundColor: Colors.blue, // لون النص
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ), // زر مربع
        ),
      ),
      child: Text(
        entryButtomtext,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
