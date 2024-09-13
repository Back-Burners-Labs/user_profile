class UserModel{
  int? id;
  String? name;
  String? bio;
  String? imagePath;
  String? weight;
  String? height;
  String? sessionCompleted;
  String? challengeCompleted;
  bool? isInCommunity;

  UserModel({
    this.id,
    this.name,
    this.bio,
    this.imagePath,
    this.weight,
    this.height,
    this.sessionCompleted,
    this.isInCommunity,
    this.challengeCompleted
  });
}