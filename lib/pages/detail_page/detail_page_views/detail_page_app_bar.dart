import 'package:flutter/material.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      title: const Text(
        "Biography",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}