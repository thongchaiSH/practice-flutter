import 'package:flutter/material.dart';
import './questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Questions> q = Questions.questionList;
  int score = 0;
  int number = 0;

  void showAlert() {
    Alert(
        style: AlertStyle(
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          overlayColor: Colors.black54,
          isOverlayTapDismiss: false,
          isCloseButton: false,
          animationType: AnimationType.grow,
        ),
        context: context,
        title: "Congratulations!!",
        desc: "You got $score out of ${q.length}",
        buttons: [
          DialogButton(
            width: 150,
            radius: BorderRadius.circular(20),
            child: Text(
              "Play again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              score = 0;
              setState(() {
                number = 0;
              });
            },
          )
        ]).show();
  }

  void buttonHandling(String answer) {
    if (answer == q[number].answer) {
      score++;
    }

    if (number + 1 >= q.length) {
      //end of question
      showAlert();
    } else {
      setState(() {
        number++;
      });
    }
  }

  Widget answerButton(String choice, String answer) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: OutlineButton(
        borderSide: BorderSide(width: 2, color: Color(0xFF1c4568)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => buttonHandling(
          answer,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              choice,
              style: TextStyle(color: Color(0xFF202848)),
            ),
          ),
          title: Text(
            answer,
            style:
                TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(q);

    return Container(
        width: double.infinity,
        color: Color(0xFF202848),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Question : ${number + 1} / ${q.length}",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                ),
                Expanded(
                    child: Text(
                  "${q[number].question}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                )),
                Column(children: [
                  answerButton("A", q[number].options[0]),
                  answerButton("B", q[number].options[1]),
                  answerButton("C", q[number].options[2]),
                  answerButton("D", q[number].options[3]),
                ])
              ],
            ),
          ),
        ));
  }
}
