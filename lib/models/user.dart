class CurrentUser {
  final String first_name;
  final String last_name;
  final String full_name;
  final String joined_date;
  final String id;
  final String email;

  CurrentUser({
    this.first_name,
    this.last_name,
    this.full_name,
    this.joined_date,
    this.id,
    this.email,
  });

  factory CurrentUser.fromMap(Map data) {
    return CurrentUser(
      first_name: data['userInfo']['firsName'] ?? '',
      last_name: data['userInfo']['lastName'] ?? '',
      full_name: data['userInfo']['fullName'] ?? '',
      joined_date: data['userInfo']['joinedDate'] ?? '',
      id: data['userInfo']['userId'] ?? '',
      email: data['userContacts']['userEmail'] ?? '',
    );
  }
}
