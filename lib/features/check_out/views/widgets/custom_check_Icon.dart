import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      top: -25,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xFFD9D9D9),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFF34A853),
          child: Icon(
            Icons.check,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}