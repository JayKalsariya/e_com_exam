import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/products.dart';
import '../../utils/routes.dart';

Widget productCard({
  required Size size,
  required int index,
  required BuildContext context,
}) {
  return Expanded(
    child: Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.detailPage,
                  arguments: products[index],
                );
              },
              child: Container(
                height: size.height * 18 / 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.grey.shade50,
                  image: DecorationImage(
                    image: NetworkImage(products[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                products[index]['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$ ${products[index]['price']}/-".toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
