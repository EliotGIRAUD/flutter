import 'package:flutter/material.dart';
import './exo4.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz sur les poissons",
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            Container(
              width: 340,
              height: 260,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues (),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('lib/assets/requin.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ex4Screen()),
                );
              },
              child: Text(
                "Commencer le Quiz !",
                style: TextStyle(
                  fontSize: 18, color: Colors.white
                )
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo
              ),
            ),
          ]
        )
      ),
    );
  }
}