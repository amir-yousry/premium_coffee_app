import 'package:flutter/material.dart';
import 'package:premium_coffee_app/core/data/drinks.dart';
import 'package:premium_coffee_app/features/details/ui/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Image.asset('assets/icons/cart.png', width: 25),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    drinks.length,
                    (index) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          drinks[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          drinks[index].title,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          child: Image.asset(
                            drinks[index].image,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Positioned(
                          bottom: 40,
                          right: 25,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => CoffeeDetailsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.black54,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
