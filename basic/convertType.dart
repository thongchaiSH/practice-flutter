void main(List<String> args) {
  int number = 90;
  String result = number.toString();
  print(result);

  String strNumber = "12.22";
  double dbNumber = double.parse(strNumber);
  print(dbNumber.toStringAsFixed(0));
}
