import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:greenway/api_client/footprint_result.dart';
import 'package:http/http.dart' as http;


Future<FootprintResult> fetchAPIResult(String val) async {
  //print("LIUAEGPIUWEHFOIUWEBHFLIUWEHGFPOIUWRHGEO(h");

  //{44201,14129,42101,42401,42602,44201,81102,85129,88101}

  String url = 'http://172.20.10.4:5000/get_footprint?keyword='+val;
  Response response = await get(url);
  // sample info available in response
  int statusCode = response.statusCode;
  print(response.body);
  FootprintResult footprintResult = FootprintResult.fromJson(json.decode(response.body));

  return footprintResult;

}


/*Future<double> fetchAPIResult(String num) async {

  var uri =  new Uri.https("conocochallengetamu.appspot.com", "api/",{"model_input":num});
  var response = await http.get(
    uri,
  );
  final responseJson = json.decode(response.body);
  print(responseJson['result']);

  return responseJson['result'];
}*/