void main() {
  void myFunction(String name, [int age = 0]) {
    print("Hello Function" + name);
    print(age);
  }

  void myFunction2(String name, {int age = 0, String favColor}) {
    // print(name);
    // print(age);
    // print(favColor);
    print([name, age, favColor]);
  }

  double calculate(int quantity, double price) {
    return quantity * price;
  }

  // myFunction("Fluke");
  // myFunction2("Fluke", age: 10, favColor: "2");
  print(calculate(10, 22.32).toStringAsFixed(3));

  //arrow function
  int myFunction1(a, b) => a + b;
  print(myFunction1(1, 2));

  //lamda function
  Function myFunction3 = (a, b) => a * b;

  print(myFunction3(2, 3));

  print(myFunction1(1, 2));
}
