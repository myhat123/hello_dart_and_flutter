class News {
  String title;
  String body;
  String imageUrl;

  News(this.title, this.body, this.imageUrl) {
    if (title == null) {
      throw ArgumentError("title of News cannot be null. "
          "Received: '$title'");
    }
    if (body == null) {
      throw ArgumentError("body of News cannot be null. "
          "Received: '$body'");
    }
  }
}