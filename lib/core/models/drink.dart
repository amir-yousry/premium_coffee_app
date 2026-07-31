class Drink {
  final String image;
  final String name;
  final String title;
  final String price;
  final double? height;
  final double? rightOffset;
  final double? leftOffset;

  Drink({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    this.height,
    this.leftOffset,
    this.rightOffset,
  });
}
