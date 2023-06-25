class Courses {
  final String courseName;
  final String courseCode;
  final String courseType;
  final String thumbnailUrl;

  Courses({
    required this.courseName,
    required this.courseCode,
    required this.courseType,
    required this.thumbnailUrl,
  });

  static Courses fromJson(json) {
    return Courses(
        courseName: json['courseName'],
        courseCode: json['courseCode'],
        courseType: json['courseType'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
