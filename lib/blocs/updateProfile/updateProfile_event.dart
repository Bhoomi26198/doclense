abstract class UpdateUserProfileEvents {}

class UpdateProfileEvent extends UpdateUserProfileEvents {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? image;

  UpdateProfileEvent({this.firstname, this.lastname, this.email, this.image});
}
