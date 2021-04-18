void main(List<String> args) {
  Map<String, String> myColor = {
    "color1": "red",
    "color2": "green",
    "color3": "blue"
  };

  print(myColor);

  myColor.remove("color1");

  myColor['color4'] = "yellow";

  myColor.forEach((key, value) {
    print(key + " : " + value);
  });
}
