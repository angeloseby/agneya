class CollegeUpdate {
  final String heading;
  final String description;
  final String url;

  CollegeUpdate({
    required this.heading,
    required this.description,
    required this.url,
  });

  static CollegeUpdate fromJson(json) {
    return CollegeUpdate(
        heading: json['heading'],
        description: json['description'],
        url: json['url']);
  }
}
