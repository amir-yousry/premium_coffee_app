import 'package:flutter/material.dart';
import 'package:premium_coffee_app/core/data/drinks.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  const CoffeeDetailsScreen({super.key});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  //int selectedIndex = 0;
  //int? selectedSize;
  //bool isSelectedSize = false;
  //double drinkSize = 1.1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[_currentPage.round()].name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(drinks[_currentPage.round()].title),
                  ],
                ),
                Text(
                  "£${drinks[_currentPage.round()].price}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
