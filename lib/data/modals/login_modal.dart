class LoginModal {
  String? email;
  String? password;
  String? fname;
  String? lname;
  String? number;
  String? image;

  LoginModal(
      {this.email,
      this.password,
      this.fname,
      this.lname,
      this.number,
      this.image});

  LoginModal.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fname = json['fname'];
    lname = json['lname'];
    number = json['number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['fname'] = fname;
    data['lname'] = lname;
    data['number'] = number;
    data['image'] = image;
    return data;
  }
}
