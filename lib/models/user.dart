

class User {
  int id;
  String uid;
  String email;
  String name;
  int datetime;
  String picurl;

  User({this.email,this.name,this.uid, });

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "name": name,
    "picurl": picurl,
  };

  factory User.fromMap(Map<String, dynamic> json) => new User(
    //id: json["id"],
    //datetime:json["datetime"],
    email:json["email"],
    uid:json["uid"],
    name:json["name"],
    //picurl:json["picurl"],

  );

  @override
  String toString() {
    return 'User{id: $id, uid: $uid, name: $name, picurl: $picurl, datetime $datetime}';
  }

}