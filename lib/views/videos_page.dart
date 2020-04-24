import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class VideosPage extends StatelessWidget{

  final List<YT_API> ytRes;

  const VideosPage({Key key, this.ytRes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body:new Container(
          height: 400.0*ytRes.length,
          child: new ListView.builder(
            itemCount: ytRes.length-1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
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
                                Text(
                                  ytRes[index].title,
                                  overflow:TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                      color: Colors.black,
                                      fontSize: 15
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
                      height: 220,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new NetworkImage(ytRes[index].thumbnail['high']['url']),
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
    );
  }


}