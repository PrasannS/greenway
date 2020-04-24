import 'package:flutter/material.dart';
import 'package:greenway/models/shop_result.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatelessWidget {

  final List<ShopResult> shops;

  const ShopPage({Key key, this.shops}) : super(key: key);


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
      print("SHOPS CREATED");
      print(shops);
      return new Scaffold(
        backgroundColor: Colors.white,
        body:new Container(
          height: shops.length*200.0,
        child: new GridView.builder(
            itemCount:shops.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 2/3),
            itemBuilder: (BuildContext context, int index){
              return GridTile(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: GestureDetector(
                      onTap: (){
                        _launchURL(shops[index].url);
                      },
                      child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(0, 0.1),
                                  blurRadius: 3.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    child: Image.network(
                                      shops[index].image+".jpg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0, 5),
                                        blurRadius: 8.0,
                                      ),
                                    ],
                                    // IMAGE GOES HERE
                                  ),
                                ),
                              ),


                              Expanded(
                                flex:2,
                                child: Text(shops[index].item, textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Row(children: <Widget>[
                                  Text(
                                    ' __________________________',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.8,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(children: <Widget>[
                                  Text(
                                    '  ${shops[index].price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                              ),

                              Expanded(
                                flex: 1,
                                child: Row(children: <Widget>[
                                  Text(
                                    '   ${shops[index].seller}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          )),
                    ),
                  ));
            })
        )
      );
    }
  }

