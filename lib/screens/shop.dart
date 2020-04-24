import 'package:flutter/material.dart';
import 'package:greenway/models/shop_result.dart';

class ShopPage extends StatelessWidget {

  final List<ShopResult> shops;

  const ShopPage({Key key, this.shops}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.white,
        body:new Container(
        child: new GridView.builder(
            itemCount:shops.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
              return GridTile(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                            Container(
                              margin: EdgeInsets.all(5),
                              width: double.infinity,
                              height: 80,
                              child: ClipRRect(
                                child: Image.network(
                                  shops[index].url,
                                  fit: BoxFit.cover,
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
                            SizedBox(
                              height: 35,
                            ),

                            Text(shops[index].item, textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(children: <Widget>[
                              Text(
                                ' ___________________________',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.8,
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(children: <Widget>[
                              Text(
                                '    ${shops[index].price}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                '     ${shops[index].seller}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                          ],
                        )),
                  ));
            })
        )
      );
    }
  }

