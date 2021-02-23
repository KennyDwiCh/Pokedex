import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/PokeDetail.dart';
import 'package:pokedex/pokemons.dart';
import 'package:dio/dio.dart';

void main() => runApp(MaterialApp(
      title: "Poke App",
      home: new Homepage(),
      debugShowCheckedModeBanner: false,
    ));

class Homepage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomepageState createState() {
    return new _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  
  Pokemons pokemons;
  Results results;
  bool isSearching = false;
  List as = List();
  Future<List> pokelist;
  @override
  void initState() {
    super.initState();
    pokelist = getPokemon();
    print(pokelist);
    print("2nd work");
  }

  Future<List> getPokemon() async {
    var response =
        await Dio().get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=151');
    setState(() {
      var decodedJson = response.data;
      pokemons = Pokemons.fromJson(decodedJson);
      for (var i = 0; i < 151; i++) {
        results = pokemons.results[i];
        String name = results.name;
        as.insert(i, name.toUpperCase());
      }
    });
    return as;
  }

  void _filterPoke(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !isSearching
            ? Text("Pokedex")
            : TextField(
                onChanged: (value) {
                  _filterPoke(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search Pokemon",
                    hintStyle: TextStyle(color: Colors.white))),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                    });
                  })
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List>(
            future: pokelist,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(
                  itemCount: 151,
                    itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PokeDetail(snapshot.data[index])),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                            child: Text(
                              snapshot.data[index]
                            ),
                      ),
                    ),
                  );
                });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )),
      /*ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(child: Text('test')),
            );
          }),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
