import 'package:flutter/material.dart';

import '../ProductPage.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double rating;
  final double price;
  final String weight;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Левая часть: изображение в кружочке
            ClipOval(
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16), // Отступ между изображением и текстом

            // Правая часть: текстовые элементы
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Название
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4), // Отступ между строками

                  // Описание
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 8), // Отступ между строками

                  // Рейтинг
                  Row(
                    children: [
                      Text(
                        rating.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Отступ между строками
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //вес
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        weight,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      // Кнопка "Выбрать"
                      ElevatedButton(
                        onPressed: () {
                            // Обработчик нажатия на карточку
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  imageUrl: imageUrl,
                                  title: title,
                                  description: "This is a detailed description of the product. It provides all necessary information about the product",
                                  price: price,
                                  delivery: '30 min',
                                  size: 'Medium',
                                  No:"Gulten"
                                ),
                              ),
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.transparent, // Цвет иконки
                          padding: EdgeInsets.all(0), // Уменьшаем отступы
                          elevation: 0, // Убираем тень
                        ),
                        child: const Icon(
                          Icons.arrow_circle_right,
                          size: 40, // Уменьшаем размер иконки
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
