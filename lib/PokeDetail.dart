import 'package:flutter/material.dart';

class PokeDetail extends StatelessWidget {
  final String name;
  PokeDetail(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text(name)),
      body: Container(
        padding: EdgeInsets.all(10),
        child:ListView(children: <Widget>[
          GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Abilities :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Base Experience :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Moves :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Stats :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Type :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Height :') ,)
              ,)
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Text("Ability")));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8) ,
              child:Text('Weight :') ,)
              ,)
        ),
        ],
        ) 
      ),
    );
  }
}
