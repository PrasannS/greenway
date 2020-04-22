import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  get posts => null;

  get darkPrimaryColor => null;


  get primaryColor => null;


  @override
  Widget build(BuildContext context) {
    var posts;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.01),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Your Feed',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shuffle),
                      iconSize: 25,
                      color: Colors.purpleAccent,
                      onPressed: () => print('Shuffle Feed'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 25,
                        color: Colors.purpleAccent,
                        onPressed: () => print('Add Update'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: posts.length * 510.0,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return getFeedTile(index);
              },
            ),
          ),
        ],
      ),

    );
  }
  

  List<String>predefUsers = ['Prasann', 'Prasann','Vincent Do', 'Lucas Cai', 'Prasann','Lucas', 'Lucas','Vincent Do', 'Lucas Cai', 'Prasann'];

  Widget getFeedTile (int index){

    print(posts[0].image);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: Image.network(posts[index].image).image,
                        ),
                      ),
                      title: Text(predefUsers[index]
                        ,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purpleAccent,),
                      ),
                      subtitle: Text(timeago.format(DateTime.fromMillisecondsSinceEpoch(posts[index].datetime)), style: TextStyle(color: darkPrimaryColor,),),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: Colors.black45,
                        onPressed: () => print('More'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(posts[index].description),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(image: Image.network(posts[index].image).image,
                          fit: BoxFit.cover,),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        // IMAGE GOES HERE
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.favorite_border), color: Colors.purpleAccent,
                                      iconSize: 30,
                                      onPressed: () {
                                        print("LIKED!");
                                        likePost(posts[index].datetime);
                                      }
                                  ),
                                  Text(
                                    posts[index].total.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: darkPrimaryColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 10,),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.chat), color: darkPrimaryColor,
                                    iconSize: 30,
                                    onPressed: () => print('Comment'),
                                  ),
                                  Text(
                                    '62',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: darkPrimaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              child: FlatButton.icon(
                                color: primaryColor,
                                icon: Icon(Icons.add_circle, color: darkPrimaryColor,),
                                label: Text('Learn this!', style: TextStyle(
                                  color: darkPrimaryColor,
                                ),),
                                splashColor: darkPrimaryColor,
                                onPressed: () {

                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );


  }

  void likePost(datetime) {}

}