import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/screens/product.dart';
import 'package:untitled3/screens/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyHomeScreen"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_scren()));
              },
              child: Text("Go to product Screen")),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen()));
              },
              child: Text("User Screen")),

        ],
      ),
    );
  }
}
