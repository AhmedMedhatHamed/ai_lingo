import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final Widget trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: trailing,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}
