class MyColor {
  String color1;
  String color2;
  static String color3 = "green";
  String color4;

  MyColor([String color1, String color2, this.color4]) {
    this.color1 = color1;
  }
}

void main() {
  MyColor color = MyColor("red", "green", "blue");
  print(color.color1);
  print(color.color4);

  MyColor setOfColor1 = MyColor();
  setOfColor1.color1 = "red";

  MyColor setOfColor2 = MyColor();
  setOfColor2.color1 = "green";

  print(MyColor.color3);
}
