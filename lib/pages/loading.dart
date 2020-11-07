import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make the http api request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Dhaka');
    // decode the string into json and save it to map
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Page"),
    );
  }
}
