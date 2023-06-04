import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final String text;
  final IconData prefix;
  const TileButton({
    super.key,
    required this.text,
    required this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 207, 216, 220),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: ListTile(
        leading: Icon(
          prefix,
          color: Colors.black,
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
