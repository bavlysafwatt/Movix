import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
      {super.key, required this.errorText, required this.retryFunction});

  final String errorText;
  final Function retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcons.error,
            size: 30,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            "Error: $errorText",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.black54),
              overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
            ),
            child: Text(
              "Retry",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
