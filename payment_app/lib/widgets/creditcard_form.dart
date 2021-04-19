import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditCardForm extends StatefulWidget {
  final int price;
  final Function formSubmit;
  CreditCardForm(this.price, this.formSubmit);

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  Widget cardForm({
    String label,
    bool obsecure = false,
    TextInputType inputType = TextInputType.text,
    Function saveValue,
    Function validation,
    TextInputFormatter formatter,
  }) {
    return TextFormField(
      inputFormatters: [formatter],
      keyboardType: inputType,
      obscureText: obsecure,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black26,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black26,
          )),
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 15,
              color: Colors.black45,
              fontWeight: FontWeight.bold)),
      style: TextStyle(
          fontSize: 15, color: Colors.black45, fontWeight: FontWeight.bold),
      onSaved: saveValue,
      validator: validation,
    );
  }

  final currency = NumberFormat('#,###', 'en_US');

  String _cardHolder;

  final GlobalKey<FormState> _formKey = GlobalKey();

  var cardHolderFormatter = WhitelistingTextInputFormatter(RegExp("[a-zA-z]"));
  var cardNumberFormatter = MaskTextInputFormatter(
      mask: "####-####-####-####", filter: {"#": RegExp(r'[0-9]')});
  var expiryDateFormatter =
      MaskTextInputFormatter(mask: "##/####", filter: {"#": RegExp(r'[0-9]')});
  var cvvFormatter =
      MaskTextInputFormatter(mask: "###", filter: {"#": RegExp(r'[0-9]')});

  void submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    _formKey.currentState.save();

    widget.formSubmit(_cardHolder, cardNumberFormatter.getUnmaskedText(),
        expiryDateFormatter.getMaskedText(), cvvFormatter.getMaskedText());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  cardForm(
                      label: "Full name",
                      formatter: cardHolderFormatter,
                      saveValue: (value) {
                        _cardHolder = value;
                      },
                      validation: (value) {
                        if (value.isEmpty) {
                          return "Card holder cannot be empty.";
                        }
                        return null;
                      }),
                  cardForm(
                      label: "Card Number",
                      validation: (String value) {
                        if (value.isEmpty || value.length < 19) {
                          return "Invalid card number.";
                        }
                        return null;
                      },
                      formatter: cardNumberFormatter,
                      inputType: TextInputType.number),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        child: cardForm(
                            label: "Expiry date",
                            validation: (String value) {
                              if (value.isEmpty || value.length < 7) {
                                return "Invalid expiry date.";
                              }
                              return null;
                            },
                            formatter: expiryDateFormatter,
                            inputType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 160,
                        child: cardForm(
                            label: "CVV",
                            validation: (String value) {
                              if (value.isEmpty || value.length < 3) {
                                return "Invalid security code.";
                              }
                              return null;
                            },
                            formatter: cvvFormatter,
                            inputType: TextInputType.number),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.black26,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Secure payment",
                  style: TextStyle(color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: RaisedButton(
              padding: EdgeInsets.all(13),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: submit,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Pay ฿ ${currency.format(widget.price)} THB",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
