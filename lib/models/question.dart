class Question {
  final String question;
  final String id;
  final String ans_1;
  final String ans_2;
  final String ans_3;
  final String ans_4;
  final String mediaType;
  final String mediaUrl;
  final String filter_id;
  final String subject;
  final bool active;

  Question(
    this.question,
    this.id,
    this.ans_1,
    this.ans_2,
    this.ans_3,
    this.ans_4,
    this.mediaType,
    this.mediaUrl,
    this.active,
    this.subject,
    this.filter_id,
  );
}
