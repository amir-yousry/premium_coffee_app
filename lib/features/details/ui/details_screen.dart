import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:premium_coffee_app/core/data/drinks.dart';
import 'package:premium_coffee_app/features/details/ui/widgets/toggle_widget.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  const CoffeeDetailsScreen({super.key});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  int? selectedSize;
  double drinkSize = 1.1;

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
            top: 50,
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

          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(drinks[index].image, height: 650),
                          Positioned(
                            bottom: 100,
                            right: 0,
                            left: 0,
                            child: Image.asset("assets/drinks/Ellipse 2.png"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedSize == index
                              ? Colors.orange
                              : Colors.white,
                          border: Border.all(
                            color: selectedSize == index
                                ? Colors.orange
                                : Colors.black,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/Vector.svg",
                          colorFilter: ColorFilter.mode(
                            selectedSize == index ? Colors.white : Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: DrinkToggle()),
                    SizedBox(width: 40),
                    Expanded(child: QuantitySelector()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
