import 'package:flutter/material.dart';
import 'package:greenway/models/web_result.dart';
import 'package:url_launcher/url_launcher.dart';


class ResourcesPage extends StatelessWidget {

  final List<WebResult> webresu;

  const ResourcesPage({Key key, this.webresu}) : super(key: key);


  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    url = url.replaceAll(" ", "");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView.builder(
          itemCount: webresu.length,
          itemBuilder: (context, i) {
            return new ExpansionTile(
              title: new Text(webresu[i].name),
              children: <Widget>[
                _genList(i),
              ],
            );
          },
        ));
  }

  Widget _genList(int i) {
    return new Column(
      children: <Widget>[
        GestureDetector(
          child: getTextWidget(webresu[i].titles[0]),
          onTap: (){
            _launchURL(webresu[i].urls[0]);
            },
        ),
        GestureDetector(
          child: getTextWidget(webresu[i].titles[1]),
          onTap: (){
            _launchURL(webresu[i].urls[1]);
          },
        ),
        GestureDetector(
          child: getTextWidget(webresu[i].titles[2]),
          onTap: (){
            _launchURL(webresu[i].urls[2]);
          },
        ),
      ],
    );
  }

  Widget getTextWidget(String s) {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          child: Text('$s'),
          width: 370,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

}


