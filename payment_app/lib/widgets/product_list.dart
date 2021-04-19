import 'package:flutter/material.dart';
import 'package:payment_app/model/product.dart';
import 'package:intl/intl.dart';

class ProductList extends StatelessWidget {
  final List<Products> products;
  final Function showProduct;

  ProductList(this.products, this.showProduct);

  final currency = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, i) {
          return Container(
            width: 130,
            child: GestureDetector(
              onTap: () {
                showProduct(products[i]);
              },
              child: Card(
                // elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.network(
                            products[i].image,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: products[i].title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            "฿ ${currency.format(products[i].price)}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.redAccent),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
