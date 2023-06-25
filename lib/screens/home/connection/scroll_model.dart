class Scroll {
  final String title;
  final String subTitle;
  final String imgUrl;

  Scroll({
    required this.title,
    required this.subTitle,
    required this.imgUrl,
  });

  static Scroll fromJson(json) {
    return Scroll(
        title: json['title'],
        subTitle: json['subTitle'],
        imgUrl: json['imgUrl']);
  }
}
