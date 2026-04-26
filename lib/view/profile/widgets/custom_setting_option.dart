import 'package:flutter/material.dart';

class CustomSettingOption extends StatelessWidget {
  const CustomSettingOption({
    super.key,
    this.icon,
    this.iconColor,
    required this.title,
    this.textColor,
  });

  final String title;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
