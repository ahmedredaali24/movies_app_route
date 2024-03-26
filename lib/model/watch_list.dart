class WatchList {
  static const String collectionName = "Added";
  String? id;
  int? idMovie;
  String? image;

  String? title;

  String? date;

  String? content;
  bool? isDone;

  WatchList(
      {required this.title,
      required this.idMovie,
      required this.content,
      this.isDone = false,
      required this.image,
      required this.date,
      this.id = ""});

  // json => object
  WatchList.fromJson(Map<String, dynamic> data)
      : this(
          id: data["id"] as String?,
          idMovie: data["idMovie"] as int?,
          title: data["title"] as String?,
          content: data["content"] as String?,
          isDone: data["isDone"] as bool?,
          image: data["image"] as String?,
          date: data["date"] as String?,
        );

  // object => json
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "isDone": isDone,
      "date": date,
      "image": image,
      "id": id,
      "idMovie": idMovie
    };
  }
}
