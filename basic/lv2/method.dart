void main(List<String> args) {
  Product p = Product();
  p.calculate(price: 10, qyt: 12);
}

class Product {
  int price;
  int qty;
  void calculate({int price, int qyt}) {
    print(price * qyt);
  }
}
