import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? title;
  final VoidCallback? button;

  const RoundedButton({
    required this.title,
    required this.button,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: button,
          minWidth: 100.0,
          height: 42.0,
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
