import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConstants.primaryBlue,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
