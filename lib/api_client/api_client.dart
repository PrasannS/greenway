import 'dart:async';
import 'dart:convert';
import 'package:greenway/models/shop_result.dart';
import 'package:greenway/models/web_result.dart';
import 'package:http/http.dart';
import 'package:greenway/models/footprint_result.dart';
import 'package:http/http.dart' as http;


Future<FootprintResult> fetchFootprintResult(String val) async {

  String url = 'http://192.168.0.33:5000/get_footprint?keyword='+val;
  Response response = await get(url);
  // sample info available in response
  print(response.body);
  FootprintResult footprintResult = FootprintResult.fromJson(json.decode(response.body));

  return footprintResult;

}

Future<List> fetchWebResult(String val) async {

  String url = 'http://192.168.0.33:5000/get_web_data?item='+val;
  Response response = await get(url);

  print(response);
  var j = json.decode(response.body);
  List<WebResult> webresults = [];
  for(Map<String, dynamic> m in j['result']){
    webresults.add(WebResult.fromJson(m));
  }

  print(webresults);

  return webresults;

}


Future<List> fetchShopResult(String val) async {

  String url = 'http://192.168.0.33:5000/get_shop_data?item='+val;
  Response response = await get(url);

  var j = json.decode(response.body);
  List<ShopResult> webresults = [];
  for(Map<String, dynamic> m in j['result']){
    webresults.add(ShopResult.fromJson(m));
  }

  print(webresults);

  return webresults;

}
