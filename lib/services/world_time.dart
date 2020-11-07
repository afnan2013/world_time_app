import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  //location name for the UI
  String time;  // the time in that location
  String flag;  // the flag of that country in that location
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      // make the http api request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      // decode the string into json and save it to map
      Map data = jsonDecode(response.body);
      //print(data);
      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //print('$dateTime - $offset');

      //create DateTime Object
      DateTime now = DateTime.parse(dateTime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      //print('um here $now');

      isDayTime = (now.hour > 6 && now.hour < 19)?true:false;
      // set the time property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error - $e');
      time = "Could not get Time Data";
    }
  }
}