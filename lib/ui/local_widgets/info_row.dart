import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        Text(
          subTitle,
        ),
      ],
    );
  }
}
