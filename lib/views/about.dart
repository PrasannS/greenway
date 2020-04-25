import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
class About extends StatelessWidget {
  final int carbon ;
  final lifespan;
  final carbontype;
  final life;
  final description;


  const About({
    Key key,
    this.carbon,
    this.lifespan,
    this.carbontype,
    this.life,
    this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(

              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: Color(0xFFB7B7B7).withOpacity(.16),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Counter(
                    color: Colors.red,
                    number: carbon,
                    title: "CO2 Footprint",
                  ),
                  Counter(
                    color: Color(0xFF36C12C),
                    number: lifespan,
                    title: "Lifespan",
                  ),
                ],
              ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,),
                child: Text(
                  " About your Item",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Google'
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Text(
              "Your item has a C02 Footprint of "
                  + carbon.toString() +
                  " and has a lifespan of "
                  + lifespan.toString() +
                " years. "
                  + description,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Google',
              ),
            ),
          )
        ],
      );
  }

}