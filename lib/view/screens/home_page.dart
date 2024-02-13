import 'package:e_com_exam/view/components/greeting.dart';
import 'package:e_com_exam/view/components/searchbar.dart';
import 'package:flutter/material.dart';

import '../../utils/products.dart';
import '../../utils/routes.dart';
import '../components/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category = [];
  List<Map<String, dynamic>> cartProduct = [];
  String? selectedCategory;

  @override
  void initState() {
    category = products
        .map((e) => e['category'].toString().toLowerCase())
        .toSet()
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          backgroundColor: Color(0xff93B1A6),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xff5C8374),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.cartPage,
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 27,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//Greeting
                greeting(size: size),
//Searchbar
                searchbar(size: size),
//Category
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectedCategory = null;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    margin: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectedCategory == null
                                          ? const Color(0xff5C8374)
                                          : Colors.grey.shade100,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 3,
                                          offset: Offset(3.0, 3.0),
                                          // spreadRadius: 1,
                                        ),
                                      ],
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: selectedCategory == null
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                  category.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      selectedCategory = category[index];
                                      cartProduct = products
                                          .where((element) =>
                                              element['category'] ==
                                              selectedCategory)
                                          .toList();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      // width: 100,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      margin: const EdgeInsets.all(7),
// container decoration
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            selectedCategory == category[index]
                                                ? const Color(0xff5C8374)
                                                : Colors.grey.shade100,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 3,
                                            offset: Offset(3.0, 3.0),
                                            // spreadRadius: 1,
                                          ),
                                        ],
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
// container in category text
                                      child: Center(
                                        child: Text(
                                          category[index]
                                              .toLowerCase()
                                              .replaceFirst(
                                                category[index][0],
                                                category[index][0]
                                                    .toUpperCase(),
                                              ),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: selectedCategory ==
                                                    category[index]
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
//Products
                ...List.generate(
                  selectedCategory != null
                      ? cartProduct.length ~/ 2
                      : products.length ~/ 2,
                  (index) {
                    return Row(
                      children: [
                        productCard(
                          size: size,
                          index: selectedCategory != null
                              ? products.indexOf(cartProduct[index * 2])
                              : index * 2,
                          context: context,
                        ),
                        productCard(
                          size: size,
                          index: selectedCategory != null
                              ? products.indexOf(cartProduct[index * 2 + 1])
                              : index * 2 + 1,
                          context: context,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
