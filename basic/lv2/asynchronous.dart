import 'dart:io';

void main(List<String> args) async {
  task1() {
    print("task1 complete!");
  }

  Future<String> task2() async {
    // sleep(Duration(seconds: 2));
    await Future.delayed(Duration(seconds: 2));
    print("task2 complete!");
    return "abc";
  }

  task3(String result) {
    print("task3 complete! $result");
  }

  task1();

  var result = await task2();
  print(result);

  task3(result);
}
