import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final IconData icon;
  const CustomIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.purple)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
