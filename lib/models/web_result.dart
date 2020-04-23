
class WebResult {
  final String name;
  final List<String> titles;
  final List<String> urls;

  WebResult({this.name, this.titles, this.urls});


  factory WebResult.fromJson(Map<String, dynamic> json) {
    return WebResult(
        name: json['name'],
        titles: json['titles'].cast<String>(),
        urls: json['urls'].cast<String>(),
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString()+" "+titles.toString()+" "+urls.toString();
  }

}