import 'dart:convert';

/// user : {"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","mobile":"+971501110001","email":"jenny@example.com","dob":"1998-05-21","gender":"Female","bio":"Living life one photo at a time 📸 | Travel lover | Coffee addict","profile_image":"https://i.pravatar.cc/150?img=47","interests":["Travel","Photography","Coffee","Music"],"age":27}
/// posts : [{"id":11,"post_type":"image","image_url":"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600","video_url":null,"thumbnail_url":null},{"id":12,"post_type":"image","image_url":"https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600","video_url":null,"thumbnail_url":null},{"id":13,"post_type":"image","image_url":"https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=600","video_url":null,"thumbnail_url":null},{"id":14,"post_type":"image","image_url":"https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=600","video_url":null,"thumbnail_url":null},{"id":15,"post_type":"image","image_url":"https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=600","video_url":null,"thumbnail_url":null},{"id":16,"post_type":"video","image_url":null,"video_url":"https://www.w3schools.com/html/mov_bbb.mp4","thumbnail_url":"https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=600"},{"id":17,"post_type":"text","image_url":null,"video_url":null,"thumbnail_url":null},{"id":18,"post_type":"text","image_url":null,"video_url":null,"thumbnail_url":null},{"id":1,"post_type":"image","image_url":"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600","video_url":null,"thumbnail_url":null}]
/// feed : [{"id":11,"post_type":"image","image_url":"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600","video_url":null,"thumbnail_url":null,"caption":"Golden hour in Santorini 🌅 Nothing beats this view!","text_content":null,"likes_count":342,"comments_count":28,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":12,"post_type":"image","image_url":"https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600","video_url":null,"thumbnail_url":null,"caption":"Morning coffee ritual ☕ Starting the day right","text_content":null,"likes_count":189,"comments_count":14,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":13,"post_type":"image","image_url":"https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=600","video_url":null,"thumbnail_url":null,"caption":"Exploring hidden streets of Rome 🇮🇹","text_content":null,"likes_count":521,"comments_count":47,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":14,"post_type":"image","image_url":"https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=600","video_url":null,"thumbnail_url":null,"caption":"Bali sunsets hit different 🌴","text_content":null,"likes_count":610,"comments_count":52,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":15,"post_type":"image","image_url":"https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=600","video_url":null,"thumbnail_url":null,"caption":"Paris in the rain is still magical 🗼","text_content":null,"likes_count":480,"comments_count":39,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":16,"post_type":"video","image_url":null,"video_url":"https://www.w3schools.com/html/mov_bbb.mp4","thumbnail_url":"https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=600","caption":"Travel vlog: 48 hours in Tokyo 🇯🇵✈️","text_content":null,"likes_count":892,"comments_count":74,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":17,"post_type":"text","image_url":null,"video_url":null,"thumbnail_url":null,"caption":null,"text_content":"Traveling solo taught me more about myself than any relationship ever did. The world is your classroom. 🌍✨","likes_count":445,"comments_count":38,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":18,"post_type":"text","image_url":null,"video_url":null,"thumbnail_url":null,"caption":null,"text_content":"PSA: You don't need a travel buddy to explore the world. Pack your bags and go. The best stories are the ones you write alone. 🎒","likes_count":312,"comments_count":27,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":1,"post_type":"image","image_url":"https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600","video_url":null,"thumbnail_url":null,"caption":"Golden hour in Santorini 🌅 Nothing beats this view!","text_content":null,"likes_count":342,"comments_count":28,"post_timing":"3 days ago","user":{"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}}]

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({ProfileUser? user, List<Posts>? posts, List<Feed>? feed}) {
    _user = user;
    _posts = posts;
    _feed = feed;
  }

  ProfileModel.fromJson(dynamic json) {
    _user = json['user'] != null ? ProfileUser.fromJson(json['user']) : null;
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(Posts.fromJson(v));
      });
    }
    if (json['feed'] != null) {
      _feed = [];
      json['feed'].forEach((v) {
        _feed?.add(Feed.fromJson(v));
      });
    }
  }
  ProfileUser? _user;
  List<Posts>? _posts;
  List<Feed>? _feed;
  ProfileModel copyWith({ProfileUser? user, List<Posts>? posts, List<Feed>? feed}) =>
      ProfileModel(user: user ?? _user, posts: posts ?? _posts, feed: feed ?? _feed);
  ProfileUser? get user => _user;
  List<Posts>? get posts => _posts;
  List<Feed>? get feed => _feed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    if (_feed != null) {
      map['feed'] = _feed?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 11
/// post_type : "image"
/// image_url : "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
/// video_url : null
/// thumbnail_url : null
/// caption : "Golden hour in Santorini 🌅 Nothing beats this view!"
/// text_content : null
/// likes_count : 342
/// comments_count : 28
/// post_timing : "3 days ago"
/// user : {"id":1,"full_name":"Jenny Wilson","username":"jenny_wilson12","profile_image":"https://i.pravatar.cc/150?img=47"}

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));
String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  Feed({
    num? id,
    String? postType,
    String? imageUrl,
    String? videoUrl,
    dynamic thumbnailUrl,
    String? caption,
    dynamic textContent,
    num? likesCount,
    num? commentsCount,
    String? postTiming,
    User? user,
  }) {
    _id = id;
    _postType = postType;
    _imageUrl = imageUrl;
    _videoUrl = videoUrl;
    _thumbnailUrl = thumbnailUrl;
    _caption = caption;
    _textContent = textContent;
    _likesCount = likesCount;
    _commentsCount = commentsCount;
    _postTiming = postTiming;
    _user = user;
  }

  Feed.fromJson(dynamic json) {
    _id = json['id'];
    _postType = json['post_type'];
    _imageUrl = json['image_url'];
    _videoUrl = json['video_url'] as String?;
    _thumbnailUrl = json['thumbnail_url'];
    _caption = json['caption'];
    _textContent = json['text_content'];
    _likesCount = json['likes_count'];
    _commentsCount = json['comments_count'];
    _postTiming = json['post_timing'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  String? _postType;
  String? _imageUrl;
  String? _videoUrl;
  dynamic _thumbnailUrl;
  String? _caption;
  dynamic _textContent;
  num? _likesCount;
  num? _commentsCount;
  String? _postTiming;
  User? _user;
  Feed copyWith({
    num? id,
    String? postType,
    String? imageUrl,
    String? videoUrl,
    dynamic thumbnailUrl,
    String? caption,
    dynamic textContent,
    num? likesCount,
    num? commentsCount,
    String? postTiming,
    User? user,
  }) => Feed(
    id: id ?? _id,
    postType: postType ?? _postType,
    imageUrl: imageUrl ?? _imageUrl,
    videoUrl: videoUrl ?? _videoUrl,
    thumbnailUrl: thumbnailUrl ?? _thumbnailUrl,
    caption: caption ?? _caption,
    textContent: textContent ?? _textContent,
    likesCount: likesCount ?? _likesCount,
    commentsCount: commentsCount ?? _commentsCount,
    postTiming: postTiming ?? _postTiming,
    user: user ?? _user,
  );
  num? get id => _id;
  String? get postType => _postType;
  String? get imageUrl => _imageUrl;
  String? get videoUrl => _videoUrl;
  dynamic get thumbnailUrl => _thumbnailUrl;
  String? get caption => _caption;
  dynamic get textContent => _textContent;
  num? get likesCount => _likesCount;
  num? get commentsCount => _commentsCount;
  String? get postTiming => _postTiming;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_type'] = _postType;
    map['image_url'] = _imageUrl;
    map['video_url'] = _videoUrl;
    map['thumbnail_url'] = _thumbnailUrl;
    map['caption'] = _caption;
    map['text_content'] = _textContent;
    map['likes_count'] = _likesCount;
    map['comments_count'] = _commentsCount;
    map['post_timing'] = _postTiming;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// id : 1
/// full_name : "Jenny Wilson"
/// username : "jenny_wilson12"
/// profile_image : "https://i.pravatar.cc/150?img=47"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({num? id, String? fullName, String? username, String? profileImage}) {
    _id = id;
    _fullName = fullName;
    _username = username;
    _profileImage = profileImage;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _username = json['username'];
    _profileImage = json['profile_image'];
  }
  num? _id;
  String? _fullName;
  String? _username;
  String? _profileImage;
  User copyWith({num? id, String? fullName, String? username, String? profileImage}) => User(
    id: id ?? _id,
    fullName: fullName ?? _fullName,
    username: username ?? _username,
    profileImage: profileImage ?? _profileImage,
  );
  num? get id => _id;
  String? get fullName => _fullName;
  String? get username => _username;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['username'] = _username;
    map['profile_image'] = _profileImage;
    return map;
  }
}

/// id : 11
/// post_type : "image"
/// image_url : "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
/// video_url : null
/// thumbnail_url : null

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({num? id, String? postType, String? imageUrl, dynamic videoUrl, dynamic thumbnailUrl}) {
    _id = id;
    _postType = postType;
    _imageUrl = imageUrl;
    _videoUrl = videoUrl;
    _thumbnailUrl = thumbnailUrl;
  }

  Posts.fromJson(dynamic json) {
    _id = json['id'];
    _postType = json['post_type'];
    _imageUrl = json['image_url'];
    _videoUrl = json['video_url'];
    _thumbnailUrl = json['thumbnail_url'];
  }
  num? _id;
  String? _postType;
  String? _imageUrl;
  dynamic _videoUrl;
  dynamic _thumbnailUrl;
  Posts copyWith({
    num? id,
    String? postType,
    String? imageUrl,
    dynamic videoUrl,
    dynamic thumbnailUrl,
  }) => Posts(
    id: id ?? _id,
    postType: postType ?? _postType,
    imageUrl: imageUrl ?? _imageUrl,
    videoUrl: videoUrl ?? _videoUrl,
    thumbnailUrl: thumbnailUrl ?? _thumbnailUrl,
  );
  num? get id => _id;
  String? get postType => _postType;
  String? get imageUrl => _imageUrl;
  dynamic get videoUrl => _videoUrl;
  dynamic get thumbnailUrl => _thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_type'] = _postType;
    map['image_url'] = _imageUrl;
    map['video_url'] = _videoUrl;
    map['thumbnail_url'] = _thumbnailUrl;
    return map;
  }
}

/// id : 1
/// full_name : "Jenny Wilson"
/// username : "jenny_wilson12"
/// mobile : "+971501110001"
/// email : "jenny@example.com"
/// dob : "1998-05-21"
/// gender : "Female"
/// bio : "Living life one photo at a time 📸 | Travel lover | Coffee addict"
/// profile_image : "https://i.pravatar.cc/150?img=47"
/// interests : ["Travel","Photography","Coffee","Music"]
/// age : 27

ProfileUser profileUserFromJson(String str) => ProfileUser.fromJson(json.decode(str));
String profileUserToJson(ProfileUser data) => json.encode(data.toJson());

class ProfileUser {
  ProfileUser({
    num? id,
    String? fullName,
    String? username,
    String? mobile,
    String? email,
    String? dob,
    String? gender,
    String? bio,
    String? profileImage,
    List<String>? interests,
    num? age,
  }) {
    _id = id;
    _fullName = fullName;
    _username = username;
    _mobile = mobile;
    _email = email;
    _dob = dob;
    _gender = gender;
    _bio = bio;
    _profileImage = profileImage;
    _interests = interests;
    _age = age;
  }

  ProfileUser.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _username = json['username'];
    _mobile = json['mobile'];
    _email = json['email'];
    _dob = json['dob'];
    _gender = json['gender'];
    _bio = json['bio'];
    _profileImage = json['profile_image'];
    _interests = json['interests'] != null ? json['interests'].cast<String>() : [];
    _age = json['age'];
  }
  num? _id;
  String? _fullName;
  String? _username;
  String? _mobile;
  String? _email;
  String? _dob;
  String? _gender;
  String? _bio;
  String? _profileImage;
  List<String>? _interests;
  num? _age;
  ProfileUser copyWith({
    num? id,
    String? fullName,
    String? username,
    String? mobile,
    String? email,
    String? dob,
    String? gender,
    String? bio,
    String? profileImage,
    List<String>? interests,
    num? age,
  }) => ProfileUser(
    id: id ?? _id,
    fullName: fullName ?? _fullName,
    username: username ?? _username,
    mobile: mobile ?? _mobile,
    email: email ?? _email,
    dob: dob ?? _dob,
    gender: gender ?? _gender,
    bio: bio ?? _bio,
    profileImage: profileImage ?? _profileImage,
    interests: interests ?? _interests,
    age: age ?? _age,
  );
  num? get id => _id;
  String? get fullName => _fullName;
  String? get username => _username;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get dob => _dob;
  String? get gender => _gender;
  String? get bio => _bio;
  String? get profileImage => _profileImage;
  List<String>? get interests => _interests;
  num? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['username'] = _username;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['bio'] = _bio;
    map['profile_image'] = _profileImage;
    map['interests'] = _interests;
    map['age'] = _age;
    return map;
  }
}
