class WebInfo {
  final String enrolled_students;
  final String header_image;
  final String main_heading;
  final String quizjets_subjects;
  final String special_aircrafts;
  final String sub_heading;
  final String legal_terms;
  final String download_app;

  WebInfo({
    this.enrolled_students,
    this.header_image,
    this.main_heading,
    this.quizjets_subjects,
    this.special_aircrafts,
    this.sub_heading,
    this.legal_terms,
    this.download_app,
  });

  factory WebInfo.fromMap(Map data) {
    return WebInfo(
      enrolled_students: data['enrolled_students'] ?? '',
      header_image: data['header_image'] ?? '',
      main_heading: data['main_heading'] ?? '',
      quizjets_subjects: data['quizjets_subjects'] ?? '',
      special_aircrafts: data['special_aircrafts'] ?? '',
      sub_heading: data['sub_heading'] ?? '',
      legal_terms: data['legal_terms'] ?? '',
      download_app: data['download_app'] ?? '',
    );
  }
}
