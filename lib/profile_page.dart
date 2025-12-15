import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: Text("Profile Page"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 300,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(width: 5),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.blue, Colors.lightBlue],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Welcome to your profile..."),
                  Image.asset("assets/images/flutter.png"),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 200,
            width: 300,
            child: Card(
              color: Colors.amber,
              shape: CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Hello Card"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
