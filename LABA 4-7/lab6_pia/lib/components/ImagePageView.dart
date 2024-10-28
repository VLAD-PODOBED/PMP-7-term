import 'package:flutter/material.dart';

class ImagePageViewer extends StatelessWidget {
  final List<String> imageUrls;

  ImagePageViewer({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Ограничиваем высоту на 200 пикселей
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}