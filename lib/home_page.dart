import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? stringResponse;
  Map? mapResponse;
  Map? dataResponse;

  //function to call api

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse!['data'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.red[100],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[100],
          ),
          child: Center(
            // child: (mapResponse == null)
            //     ? Text("Data is loading",
            // style: TextStyle(
            //   fontSize: 20,
            // ),
            // ),
            //     : Text(mapResponse!['data'].toString(),
            // style: TextStyle(
            //   fontSize: 20,
            // ),
            // ),
            child: (dataResponse == null)
                ? Text(
                    "Data is loading",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                : Text(
                    dataResponse!['email'].toString(),
                    style: TextStyle(
                      fontSize:20,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
