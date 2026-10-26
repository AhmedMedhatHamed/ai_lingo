import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.isSelected, required this.icon});

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.006,
          width: size.height * 0.048,
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey : Colors.transparent,
            borderRadius: BorderRadius.circular(size.height * 0.012),
          ),
        ),
        Icon(icon, size: size.height * 0.05),
      ],
    );
  }
}
