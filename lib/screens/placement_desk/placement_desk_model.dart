class PlacementDesk {
  final String heading;
  final String description;
  final String url;

  PlacementDesk({
    required this.heading,
    required this.description,
    required this.url,
  });

  static PlacementDesk fromJson(json) {
    return PlacementDesk(
        heading: json['heading'],
        description: json['description'],
        url: json['url']);
  }
}
