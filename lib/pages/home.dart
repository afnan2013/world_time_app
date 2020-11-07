
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime']? 'day.png': 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 120.0, 5.0, 8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                    color: Colors.grey[200],
                  ),
                  SizedBox(height:50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget> [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 35.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
