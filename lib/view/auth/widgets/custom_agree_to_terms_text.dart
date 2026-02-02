import 'package:flutter/material.dart';

class CustomAgreeToTermsText extends StatelessWidget {
  const CustomAgreeToTermsText({required this.fontWeight, super.key});

  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
      style: TextStyle(fontWeight: fontWeight),
      const TextSpan(
        children: [
          TextSpan(
            text: "I agree to the ",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "Terms and Conditions",
            style: TextStyle(color: Color(0XFF009689)),
          ),
          TextSpan(text: " and", style: TextStyle(color: Colors.black)),
          TextSpan(
            text: " Privacy Policy",
            style: TextStyle(color: Color(0XFF009689)),
          ),
        ],
      ),
    );
  }
}
