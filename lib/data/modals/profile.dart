class UserProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? mobile;
  String? status;
  String? engineerVerificationStatus;
  String? createdAt;
  String? averageRating;
  List<int>? ratingStatistics;
  String? image;

  UserProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.mobile,
    this.status,
    this.engineerVerificationStatus,
    this.createdAt,
    this.averageRating,
    this.ratingStatistics,
    this.image,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    status = json['status'];
    engineerVerificationStatus = json['engineer_verification_status'];
    createdAt = json['created_at'];
    averageRating = json['average_rating'];
    if (json['rating_statistics'] != null) {
      ratingStatistics = <int>[];
      json['rating_statistics'].forEach((v) {
        ratingStatistics!.add(v);
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['status'] = status;

    data['engineer_verification_status'] = engineerVerificationStatus;
    data['created_at'] = createdAt;
    data['average_rating'] = averageRating;
    data['rating_statistics'] = ratingStatistics;
    data['image'] = image;

    return data;
  }
}
