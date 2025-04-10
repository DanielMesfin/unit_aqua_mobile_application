import 'package:flutter/material.dart';

class PoweredByText extends StatelessWidget {
  const PoweredByText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Powered By ",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Unity Lab",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
