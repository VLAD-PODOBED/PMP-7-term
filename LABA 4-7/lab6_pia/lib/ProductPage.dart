import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String description;
  final String delivery;
  final String size;
  final String No;

  ProductPage({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.delivery,
    required this.size,
    required this.price,
    required this.No,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.brown[700], // Цвет фона страницы
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Контейнер с белым фоном и закругленными углами
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(26.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Изображение с круглой формой и звездой
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            imageUrl,
                            width: 300, // Ширина и высота для круглой формы
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          right: 10,
                          bottom: 10,
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Стоимость и кнопки
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[700],
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Действие для кнопки "Поделиться"
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                minimumSize: Size(0, 0),
                                elevation: 0,
                              ),
                              child: const Icon(
                                Icons.share,
                                color: Colors.amber,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                minimumSize: Size(10, 10),
                                elevation: 0,
                              ),
                              onPressed: () {
                                // Действие для кнопки "Просмотр"
                              },
                              child: const Icon(
                                Icons.youtube_searched_for,
                                color: Colors.amber,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Дата
                    const Row(
                      children: [
                        Text(
                          'Date: 2024-09-29',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),

                    // 3 колонки: Size, Delivery, No
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Size:',
                              style:
                              TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Text(
                              size,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ],
                        ),
                        const Text(
                          "|",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Delivery:',
                              style:
                              TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Text(
                              delivery,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ],
                        ),
                        const Text(
                          "|",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'No:',
                              style:
                              TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Text(
                              No,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Описание
                    Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )
                    ),
                  ],
                ),
              ),
            ),

            // Футер с кнопками
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.brown[700], // Коричневый фон
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Действие для кнопки "M"
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Colors.white,
                          width: 2
                      ), // Белая граница
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Закругление углов
                      ),
                    ),
                    child: const Text(
                      'L',
                      style: TextStyle(color: Colors.white), // Текст белого цвета
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Действие для кнопки "M"
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2), // Белая граница
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Закругление углов
                      ),
                    ),
                    child: const Text(
                      'M',
                      style: TextStyle(color: Colors.white), // Текст белого цвета
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Закругление углов
                      ),
                    ),
                    onPressed: () {
                      // Действие для кнопки "Добавить"
                    },
                    child: Text('Add'),
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
