
class Entry {
  int id;
  String uid;
  String image;

  String title;
  int datetime;

  Entry({this.id, this.uid, this.image, this. title, this.datetime});

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "image": image,
    "title": title,
    "datetime":datetime,
  };

  factory Entry.fromMap(Map<String, dynamic> json) => new Entry(
    id: json["id"],
    datetime:json["datetime"],
    title:json["title"],
    uid:json["uid"],
    image:json["image"],
  );

  @override
  String toString() {
    return 'Prayer{id: $id, uid: $uid, image: $image, title: $title, datetime $datetime}';
  }

}
