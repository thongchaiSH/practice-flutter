import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutCard extends StatelessWidget {
  final String title;
  final String image;
  final int price;

  CheckoutCard(this.title, this.image, this.price);

  final currency = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image,
                  width: 70,
                  height: 70,
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Quantity : 1",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Total : ฿ ${currency.format(price)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
