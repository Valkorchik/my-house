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
        color: const Color.fromRGBO(238, 238, 238, 1),
        borderRadius: BorderRadius.circular(14.0),
        child: Expanded(
          child: MaterialButton(
            minWidth: 179,
            onPressed: button,
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
