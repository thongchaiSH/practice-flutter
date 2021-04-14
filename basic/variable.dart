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
}
