class User {
  int id;
  String userName;
  int contact;

  User({this.userName, this.contact});


  User.withId({this.id, this.userName, this.contact});

  Map<String, dynamic> toMap() {
    return {'id': id, 'userName': userName, 'contact': contact};
  }

  @override
  String toString() {
    return 'User{id: $id, name: $userName, age: $contact}';
  }
}
