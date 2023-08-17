import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/images/orange-carrot.png')],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.location_solid),
                  SizedBox(width: 10),
                  Text(
                    "Tanta, Egypt",
                    style: TextStyle(
                        color: Color(0xff4C4F4D),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 364,
                height: 52,
                decoration: BoxDecoration(
                    color: const Color(0xfff2f3f2).withOpacity(1),
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xff181B19),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Search Store",
                      style: TextStyle(color: Color(0xff7C7C7C)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/banner.png"),
              const SizedBox(height: 16),
              buildRow(boldText: "Exclusive Offer"),
              const SizedBox(height: 10),
              buildProductRows(
                  imagePath1: "assets/images/banana.png",
                  productName1: "Organic Bananas",
                  productDetails1: "7pcs, Priceg",
                  productPrice1: "4.99",
                  imagePath2: "assets/images/apple.png",
                  productName2: "Red Apple",
                  productDetails2: "1kg, Priceg",
                  productPrice2: "4.99"),
              const SizedBox(height: 15),
              buildRow(boldText: "Best Selling"),
              const SizedBox(
                height: 10,
              ),
              buildProductRows(
                  imagePath1: "assets/images/red-pepper.png",
                  productName1: "Organic Bananas",
                  productDetails1: "1kg,, Priceg",
                  productPrice1: "4.99",
                  imagePath2: "assets/images/ginger.png",
                  productName2: "Red Apple",
                  productDetails2: "250gm, Priceg",
                  productPrice2: "4.99"),
              buildRow(boldText: "Groceries"),
              const SizedBox(height: 10),
              SizedBox(
                height: 105, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildCategoryContainer(
                        categoryColor1: const Color(0xfffef2e4),
                        categoryImage1: "assets/images/pulses.png",
                        categoryName1: "Pulses",
                        categoryColor2: const Color(0xfffef2e4),
                        categoryImage2: "assets/images/rices.png",
                        categoryName2: "rices");
                  },
                ),
              ),
              const SizedBox(height: 10),
              buildProductRows(
                  imagePath1: "assets/images/meat.png",
                  productName1: "Beef Bone",
                  productDetails1: "1kg, Priceg",
                  productPrice1: "4.99",
                  imagePath2: "assets/images/chicken.png",
                  productName2: "Broiler Chicken",
                  productDetails2: "1kg, Priceg",
                  productPrice2: "4.99"),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildCategoryContainer(
      {required Color categoryColor1,
      required String categoryImage1,
      required String categoryName1,
      required Color categoryColor2,
      required String categoryImage2,
      required String categoryName2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: 200,
            height: 105,
            decoration: BoxDecoration(
                color: categoryColor1, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(categoryImage1),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  categoryName1,
                  style: const TextStyle(
                      color: Color(0xff3e423f),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            )),
        const SizedBox(
          width: 20,
        ),
        Container(
            width: 240,
            height: 105,
            decoration: BoxDecoration(
                color: categoryColor2, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(categoryImage2),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  categoryName2,
                  style: const TextStyle(
                      color: Color(0xff3e423f),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            )),
      ],
    );
  }

  Row buildRow({
    required String boldText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(boldText,
            style: const TextStyle(
                color: Color(0xff181725),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        const Spacer(),
        const Text(
          "See all",
          style: TextStyle(color: color1, fontSize: 16),
        )
      ],
    );
  }

  Widget buildProductRows({
    required String imagePath1,
    required String productName1,
    required String productDetails1,
    required String productPrice1,
    required String imagePath2,
    required String productName2,
    required String productDetails2,
    required String productPrice2,
  }) {
    return SizedBox(
      height: 249,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2, // Number of rows
        itemBuilder: (context, index) {
          return buildProductRow(
            [
              ProductContainer(
                imagePath: imagePath1,
                productName: productName1,
                productDetails: productDetails1,
                productPrice: productPrice1,
              ),
              ProductContainer(
                imagePath: imagePath2,
                productName: productName2,
                productDetails: productDetails2,
                productPrice: productPrice2,
              ),
              // Add more products for each row as needed
            ],
          );
        },
      ),
    );
  }

  Widget buildProductRow(List<Widget> items) {
    return Row(
      children: [
        for (var item in items) ...[
          item,
          const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class ProductContainer extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productDetails;
  final String productPrice;

  const ProductContainer({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productDetails,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      height: 249,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffE2E2E2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff181725),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productDetails,
                  style: const TextStyle(color: Color(0xff7C7C7C)),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text("\$$productPrice"),
                const Spacer(),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
