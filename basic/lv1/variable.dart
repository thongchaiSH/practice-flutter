void main() {
  var message = "hello world";

  message = "\"tets\"";

  message = "hello world\n"
      "how are you today?";

  print("hello world " + message);

  //method
  print(message.toLowerCase());
  print(message.toUpperCase());

  message = "hello world\n";
  var message2 = "how are you today?";
  print(message + " " + message2); //String interpolation

  //number integer
  var number1 = 45;
  var number2 = 80;
  print(number1 + number2);

  var result = number1.isEven;
  print(result);

  print(number2.toStringAsFixed(2));

  //number double
  var double1 = 100.02;
  var double2 = 213.225;

  print(double2.ceil());
  print(double2.floorToDouble());
  print(double2.ceilToDouble());
  print((double2 + double1).toStringAsFixed(2));

  //Boolean
  var isMale = false;
  print(!isMale);

  // todo มาต่อวันพรุ่งนี้
}
