import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: const [
            SizedBox(height: 10),
            Text("The Hunger Games"),
            SizedBox(height: 10),
            Expanded(
              child: Image(
                image: AssetImage('assets/images/random_cover.png'),
              ),
            ),
            SizedBox(height: 10),
            Text("Suzanne Collins"),
            Text("2008"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}