import 'package:flutter/material.dart';

class CustomDoctorNameAndPrice extends StatelessWidget {
  const CustomDoctorNameAndPrice({
    super.key,
    required this.price,
    required this.doctorName,
  });

  final double price;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          doctorName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$$price",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("per session", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
