import 'package:flutter/material.dart';

class TitleBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
        children: [
          Text(
              "Good morning",
            style:TextStyle(
              fontSize: 22,
              color: Colors.grey,
            )
          ),
          Text(
              "Sanoj Dilshan",
              style:TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              )
          ),
        ],
      ),
    );
  }
}
