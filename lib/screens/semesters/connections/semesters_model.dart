class Semesters {
  int? semester;
  List<Papers>? papers;

  Semesters({this.semester, this.papers});

  Semesters.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    if (json['papers'] != null) {
      papers = <Papers>[];
      json['papers'].forEach((v) {
        papers!.add(Papers.fromJson(v));
      });
    }
  }
}

class Papers {
  String? paperName;
  String? year;
  String? paperUrl;

  Papers({this.paperName, this.year, this.paperUrl});

  Papers.fromJson(Map<String, dynamic> json) {
    paperName = json['paperName'];
    year = json['year'];
    paperUrl = json['paperUrl'];
  }

}
