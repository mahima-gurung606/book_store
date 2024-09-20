import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  const BookReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Review"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 230,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                  image: AssetImage("assets/images/book3.jpg"),
                  fit: BoxFit.contain),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "It is the story about two management stsudents whose \npretty as a picture life is thrown off track\n after a guy kisses another person creates \n a huge conflict ,so its all about \n forgiving is easy but to forget its much \n more hard. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
