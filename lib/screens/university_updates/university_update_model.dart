class UniversityUpdate {
  final String heading;
  final String description;
  final String url;

  UniversityUpdate({
    required this.heading,
    required this.description,
    required this.url,
  });

  static UniversityUpdate fromJson(json) {
    return UniversityUpdate(
        heading: json['heading'],
        description: json['description'],
        url: json['url']);
  }
}
