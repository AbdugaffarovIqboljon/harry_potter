import 'package:flutter/material.dart';

import '../../../model/character_model.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.character,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          secondText.isNotEmpty ? secondText : "No Information",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: secondText.isEmpty ? Colors.grey : null,
          ),
        )
      ],
    );
  }
}
