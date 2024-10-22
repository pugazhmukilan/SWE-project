import 'package:flutter/material.dart';

int no_of_orders = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text("Virtual Assistant  "),
          flexibleSpace: Stack(children: [
            Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child:
                    Image.asset("assets/Page_Assets/appbar_bananna_leaf.png"))
          ]),
          
        ),
         
          body: Container(
            child: Center(
              child: Text("content here ")),
          ),
          
        );
  }
}

