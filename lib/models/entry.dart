
class Entry {
  int id;
  String uid;
  String image;

  String title;
  int datetime;
  int footprint;


  Entry({this.id, this.uid, this.image, this. title, this.datetime, this.footprint});

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "image": image,
    "title": title,
    "datetime":datetime,
    "footprint":footprint
  };

  factory Entry.fromMap(Map<String, dynamic> json) => new Entry(
    id: json["id"],
    datetime:json["datetime"],
    title:json["title"],
    uid:json["uid"],
    image:json["image"],
    footprint:json['footprint']
  );

  @override
  String toString() {
    return 'Prayer{id: $id, uid: $uid, image: $image, title: $title, datetime $datetime}';
  }

}
