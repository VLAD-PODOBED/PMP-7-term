import 'package:flutter/material.dart';

class HorizontalButtonList extends StatefulWidget {
  @override
  _HorizontalButtonListState createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<HorizontalButtonList> {
  int _selectedIndex = 0; // Индекс выбранной кнопки

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Высота контейнера с кнопками
      child: ListView(
        scrollDirection: Axis.horizontal, // Горизонтальный список
        children: [
          _buildButton("All", 0),
          _buildButton("Popular", 1),
          _buildButton("Spicy", 2),
          _buildButton("Pizza", 3),
          _buildButton("Party set", 4),
        ],
      ),
    );
  }

  Widget _buildButton(String text, int index) {
    return Container(
      height: 40, // Высота контейнера с кнопками
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Отступы вокруг кнопки
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index; // Устанавливаем выбранный индекс
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: _selectedIndex == index ? Colors.amber[800] : Colors.amber, // Цвет кнопки
          padding: EdgeInsets.symmetric(horizontal: 16), // Горизонтальные отступы
          elevation: 0, // Убираем тень
        ),
        child: Text(text), // Текст кнопки
      ),
    );
  }
}
