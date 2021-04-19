import 'package:flutter/material.dart';
import 'package:payment_app/screens/checkout_screen.dart';
import '../model/product.dart';
import '../widgets/product_list.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  static List<Products> bestSelling = [
    Products(
        id: 1,
        title:
            "Hammer Anvil Bryce Men Wool Blend Double Breasted Jacket Pea Coat",
        price: 1417,
        image: 'https://i.ebayimg.com/images/g/C1UAAOSwf~Ndx~BZ/s-l1600.jpg'),
    Products(
        id: 2,
        title:
            "Men Japanese Shirt Tops Pocket Short Sleeve Denim Cotton Slim Casual Wear",
        price: 1000,
        image: "https://i.ebayimg.com/images/g/MsoAAOSwiuVexU9m/s-l1600.jpg"),
    Products(
        id: 3,
        title:
            "Women's Short Sleeve T shirt Summer Fashion Slim Party Floral Skirt 2pc dress",
        price: 1280,
        image: "https://i.ebayimg.com/images/g/6uoAAOSw-1te1183/s-l1600.jpg"),
    Products(
        id: 4,
        title:
            "Women's Short Sleeve Tops Summer Sexy Party Slim Party New Skirt 2pc",
        price: 960,
        image: "https://i.ebayimg.com/images/g/weUAAOSwEDde12P1/s-l1600.jpg"),
  ];

  String showImage = bestSelling[0].image;
  String showTitle = bestSelling[0].title;
  int showPrice = bestSelling[0].price;

  final currency = NumberFormat('#,###', 'en_US');

  void showProduct(Products product) {
    // print(product.image);
    setState(() {
      showImage = product.image;
      showTitle = product.title;
      showPrice = product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.red, Colors.pinkAccent])),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    child: Image.network(
                      showImage,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.6,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: <Color>[
                          Colors.black87,
                          Colors.transparent
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            showTitle,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "฿ ${currency.format(showPrice)}",
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: FlatButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.redAccent,
                    child: Text("Buy now"),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CheckoutScreen(showTitle, showImage, showPrice);
                      }));
                    },
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    "Best selling",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ProductList(bestSelling, showProduct),
              ],
            )
          ],
        ),
      ),
    );
  }
}
