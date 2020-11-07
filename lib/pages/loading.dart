import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading Time";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location:'Dhaka', flag:'bangladesh.png', url: 'Asia/Dhaka');
    await instance.getTime();
    //print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('$time'),
      )
    );
  }
}
