import 'package:flutter/material.dart';

class SingleItemPage extends StatelessWidget {
  final img, title;
  const SingleItemPage({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleItem Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(img, height: 100, width: 100),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
