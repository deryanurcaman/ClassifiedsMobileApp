class User_Account {
  late String fullName, mail, password, id;

  User_Account({
    required this.id,
    required this.fullName,
    required this.mail,
    required this.password,
  });

  User_Account.fromMap(dynamic obj) {
    id = obj.id;
    fullName = obj['fullName'];
    mail = obj['mail'];
    password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = this.id;
      map['fullName'] = this.fullName;
      map['mail'] = this.mail;
      map['password'] = this.password;
    }
    return map;
  }
}
