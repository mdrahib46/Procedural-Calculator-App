import 'package:flutter/material.dart';


class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key, required this.text, this.color, required this.onTap,
  });

  final String text;
  final Color? color;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: color ?? Colors.grey[800],
          ),
          onPressed: onTap,
          child: Text(text, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
        ),
      ),
    );
  }
}
