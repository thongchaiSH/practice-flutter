import 'package:flutter/material.dart';
import 'package:payment_app/helper/omise.dart';
import 'package:payment_app/widgets/checkout_card.dart';
import 'package:payment_app/widgets/creditcard_form.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CheckoutScreen extends StatefulWidget {
  final String productTitle;
  final String productImage;
  final int productPrice;

  CheckoutScreen(this.productTitle, this.productImage, this.productPrice);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isLoading = false;

  void formSubmit(String cardHolder, String cardNumber, String expireDate,
      String cvv) async {
    print([cardHolder, cardNumber, expireDate, cvv]);

    List<String> _expSplit = [];
    _expSplit = expireDate.split("/");

    final price = (widget.productPrice * 100).toString();
    // print(price);
    setState(() {
      _isLoading = true;
    });
    try {
      Omise charge = Omise(
          name: cardHolder,
          number: cardNumber,
          expMonth: _expSplit[0],
          expYear: _expSplit[1],
          security: cvv,
          price: price);

      await charge.getToken();
      await charge.cardCharge();
      showDialog(charge.status, AlertType.success);
    } catch (e) {
      showDialog(e, AlertType.warning);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void showDialog(String message, AlertType alert) {
    Alert(
        style: AlertStyle(
            isCloseButton: false,
            animationType: AnimationType.grow,
            isOverlayTapDismiss: false),
        title: "Checkout message",
        desc: message,
        context: context,
        type: alert,
        buttons: [
          DialogButton(
            color: Color.fromRGBO(0, 179, 134, 1.0),
            onPressed: () {
              Navigator.of(context).pop();
              if (message == "successful") {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "Confirm",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.red, Colors.pinkAccent])),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckoutCard(widget.productTitle, widget.productImage,
                        widget.productPrice),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Card Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 16),
                      ),
                    ),
                    CreditCardForm(widget.productPrice, formSubmit),
                  ],
                ),
              ),
            ),
    );
  }
}
