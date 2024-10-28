import 'package:flutter/material.dart';
import 'package:lab4_5_pia/ProductStore.dart';
import 'package:lab4_5_pia/lab6.dart';

import 'HorizontalButtonList.dart';
import 'TitleBlock.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0; // Индекс выбранной иконки

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: 700, //высота
            width: 80, // Ширина боковой панели
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildIconButton(Icons.home, 0),
                _buildIconButton(Icons.search, 1),
                _buildIconButton(Icons.coffee, 2),
                _buildIconButton(Icons.cookie, 3),
                _buildIconButton(Icons.rice_bowl, 4),
                _buildIconButton(Icons.water, 5),
                _buildIconButton(Icons.fastfood, 6),
                _buildIconButton(Icons.settings, 7),
                // Добавьте дополнительные кнопки по желанию
              ],
            ),
          ),
          // Основное содержимое страницы
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0), // Установите нужный отступ слева
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  TitleBlock(),
                  SizedBox(height: 20),
                  HorizontalButtonList(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                            "(10 Dishes)",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber[600],
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(

                        child: const Icon(
                          Icons.arrow_circle_right,
                          size: 36,
                        ),
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => lab6(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 40, // Задаем ширину для иконки
                        child: Icon(
                          Icons.menu,
                          color: Colors.amber[600],
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ProductStore(),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, int index) {
    return Expanded( // Используем Expanded для растягивания иконки по высоте
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: _selectedIndex == index
                ? Border.all(color: Colors.amber, width: 2) // Бордер вокруг выбранной иконки
                : null,
            borderRadius: BorderRadius.circular(20), // Закругленные края
          ),
          padding: EdgeInsets.fromLTRB(10,0,10,0), // Отступ для кнопки
          child: Icon(
            icon,
            color: Colors.amber, // Цвет иконки
          ),
        ),
      ),
    );
  }
}