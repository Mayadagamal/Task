
import 'dart:convert';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchPlayers() async {

    var result;
    return json.decode(result.body)['results'];
  }

  String name(dynamic player) {
    return player['name']['first'] + " " + player['name']
    ['last'];
  }

  String position(dynamic player) {
    return player['name']['last'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          margin: const EdgeInsets.fromLTRB(35, 45, 30, 20),
          child:

          FutureBuilder<List<dynamic>>(
            future: fetchPlayers(),
            builder: (BuildContext context, AsyncSnapshot
            snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: [
                      Container(
                        child: Text("I want a container here"),
                      ),

                      ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int
                          index) {
                            return
                              Card(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: CircleAvatar(
                                          radius: 30, backgroundImage:
                                      NetworkImage(
                                          snapshot.data[index]
                                          ['picture']['large'])),

                                      title:
                                      Text(name(snapshot.data[index])),
                                      subtitle:
                                      Text(position(snapshot.data[index])),

                                    )
                                  ],
                                ),
                              );
                          })


                    ]
                );
              }
              else {
                return Center(child:
                CircularProgressIndicator());
              }
            },


          ),)


    );
  }
}