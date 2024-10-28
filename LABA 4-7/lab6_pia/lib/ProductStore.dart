import 'package:flutter/material.dart';
import 'components/ProductCard.dart';

class ProductStore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Количество карточек в строке
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.44, // Пропорции карточки (ширина к высоте)
        ),
        itemCount: 10, // Количество элементов
        itemBuilder: (context, index) {
          // Передайте данные о продукте в карточку
          return GestureDetector(
            child: ProductCard(
              imageUrl: 'assets/images/food.jpg',
              title: 'Еда',
              description: 'Updated | May 30, 2022, 21:17',
              rating: 5,
              price: 100,
              weight: '480g',),
          );
        },
      ),
    );
  }
}