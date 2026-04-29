import 'dart:convert';

/// id : 20
/// full_name : "Jenny Wilson"
/// username : "jenny_wilson12"
/// mobile : "+971501234567"
/// email : "jenny@example.com"
/// gender : "Female"
/// dob : "1998-05-21"
/// bio : null
/// profile_image : null
/// cover_image : null
/// interests : "[]"
/// followers_count : 0
/// following_count : 0
/// posts_count : 0

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    num? id,
    String? fullName,
    String? username,
    String? mobile,
    String? email,
    String? gender,
    String? dob,
    dynamic bio,
    dynamic profileImage,
    dynamic coverImage,
    String? interests,
    num? followersCount,
    num? followingCount,
    num? postsCount,
  }) {
    _id = id;
    _fullName = fullName;
    _username = username;
    _mobile = mobile;
    _email = email;
    _gender = gender;
    _dob = dob;
    _bio = bio;
    _profileImage = profileImage;
    _coverImage = coverImage;
    _interests = interests;
    _followersCount = followersCount;
    _followingCount = followingCount;
    _postsCount = postsCount;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _username = json['username'];
    _mobile = json['mobile'];
    _email = json['email'];
    _gender = json['gender'];
    _dob = json['dob'];
    _bio = json['bio'];
    _profileImage = json['profile_image'];
    _coverImage = json['cover_image'];
    _interests = json['interests'];
    _followersCount = json['followers_count'];
    _followingCount = json['following_count'];
    _postsCount = json['posts_count'];
  }
  num? _id;
  String? _fullName;
  String? _username;
  String? _mobile;
  String? _email;
  String? _gender;
  String? _dob;
  dynamic _bio;
  dynamic _profileImage;
  dynamic _coverImage;
  String? _interests;
  num? _followersCount;
  num? _followingCount;
  num? _postsCount;
  UserModel copyWith({
    num? id,
    String? fullName,
    String? username,
    String? mobile,
    String? email,
    String? gender,
    String? dob,
    dynamic bio,
    dynamic profileImage,
    dynamic coverImage,
    String? interests,
    num? followersCount,
    num? followingCount,
    num? postsCount,
  }) => UserModel(
    id: id ?? _id,
    fullName: fullName ?? _fullName,
    username: username ?? _username,
    mobile: mobile ?? _mobile,
    email: email ?? _email,
    gender: gender ?? _gender,
    dob: dob ?? _dob,
    bio: bio ?? _bio,
    profileImage: profileImage ?? _profileImage,
    coverImage: coverImage ?? _coverImage,
    interests: interests ?? _interests,
    followersCount: followersCount ?? _followersCount,
    followingCount: followingCount ?? _followingCount,
    postsCount: postsCount ?? _postsCount,
  );
  num? get id => _id;
  String? get fullName => _fullName;
  String? get username => _username;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get gender => _gender;
  String? get dob => _dob;
  dynamic get bio => _bio;
  dynamic get profileImage => _profileImage;
  dynamic get coverImage => _coverImage;
  String? get interests => _interests;
  num? get followersCount => _followersCount;
  num? get followingCount => _followingCount;
  num? get postsCount => _postsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['username'] = _username;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['bio'] = _bio;
    map['profile_image'] = _profileImage;
    map['cover_image'] = _coverImage;
    map['interests'] = _interests;
    map['followers_count'] = _followersCount;
    map['following_count'] = _followingCount;
    map['posts_count'] = _postsCount;
    return map;
  }
}
