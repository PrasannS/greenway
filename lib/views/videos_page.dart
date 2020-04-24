import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget{

  @override
  _VidState createState() => _VidState();

}

class _VidState extends State<VideosPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body:new Container(
          child: new GridView.count(
            crossAxisCount: 1,
            scrollDirection: Axis.vertical,
            children: new List<Widget>.generate(16, (index) {
              return new Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Stack(
                        children: [
                          Padding(padding: const EdgeInsets.all(10),
                          child:Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "0"+ (++index).toString(),
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 32,
                                  ),
                                ),
                                SizedBox(width: 20),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "19:04 mins\n",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.5),
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "How to make Organic Shoes!",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          color: Colors.black,
                                          fontSize: 15
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green.withOpacity(1),
                                  ),
                                  child: Icon(Icons.play_arrow, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new NetworkImage('https://i.ytimg.com/vi/VCjH1zNs530/maxresdefault.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    )
                  ],
                ),
                  );
            }),
          ),
        )
    );
  }


}