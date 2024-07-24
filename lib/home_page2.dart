import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  String? stringResponse;
  Map? mapResponse;
  Map? dataResponse;
  List? listResponse;

  //function to call api

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        // dataResponse = mapResponse!['data'];
        listResponse = mapResponse!['data'];
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
            child: (listResponse == null)
                ? Text(
                    "Data is loading",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                // : Text(
                //     listResponse![0].toString(),
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),

                //to get the first name of first person in the list
                // : Text(
                //     listResponse![0]['first_name'].toString(),
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),

                //to get the email-id of second person in the list
                : Text(
                    listResponse![1]['email'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
