// ignore: file_names
class UserListModal {
  int? id;
  String? name;
  int? status;
  String? statusText;
  String? createdAt;

  UserListModal(
      {this.id, this.name, this.status, this.statusText, this.createdAt});

  UserListModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    statusText = json['status_text'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['status_text'] = statusText;
    data['created_at'] = createdAt;
    return data;
  }
}
