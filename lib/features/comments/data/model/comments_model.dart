import 'dart:convert';

/// comments : [{"id":157,"comment":"Love this so much! ❤️","comment_timing":"3 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}},{"id":158,"comment":"Goals! 🙌","comment_timing":"3 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12","full_name":"Alex Carter"}},{"id":159,"comment":"Where is this? I need to go!","comment_timing":"3 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32","full_name":"Sofia Reyes"}},{"id":160,"comment":"You always take the best photos!","comment_timing":"3 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15","full_name":"Marcus Lee"}},{"id":161,"comment":"This made my day 😊","comment_timing":"3 days ago","user":{"id":5,"profile_image":"https://i.pravatar.cc/150?img=44","full_name":"Priya Sharma"}},{"id":114,"comment":"Love this so much! ❤️","comment_timing":"3 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}},{"id":115,"comment":"Goals! 🙌","comment_timing":"3 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12","full_name":"Alex Carter"}},{"id":116,"comment":"Where is this? I need to go!","comment_timing":"3 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32","full_name":"Sofia Reyes"}},{"id":117,"comment":"You always take the best photos!","comment_timing":"3 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15","full_name":"Marcus Lee"}},{"id":118,"comment":"This made my day 😊","comment_timing":"3 days ago","user":{"id":5,"profile_image":"https://i.pravatar.cc/150?img=44","full_name":"Priya Sharma"}},{"id":77,"comment":"Love this so much! ❤️","comment_timing":"3 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}},{"id":78,"comment":"Goals! 🙌","comment_timing":"3 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12","full_name":"Alex Carter"}},{"id":79,"comment":"Where is this? I need to go!","comment_timing":"3 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32","full_name":"Sofia Reyes"}},{"id":42,"comment":"Love this so much! ❤️","comment_timing":"3 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}},{"id":43,"comment":"Goals! 🙌","comment_timing":"3 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12","full_name":"Alex Carter"}},{"id":44,"comment":"Where is this? I need to go!","comment_timing":"3 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32","full_name":"Sofia Reyes"}},{"id":45,"comment":"You always take the best photos!","comment_timing":"3 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15","full_name":"Marcus Lee"}},{"id":1,"comment":"Love this so much! ❤️","comment_timing":"3 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}},{"id":2,"comment":"Goals! 🙌","comment_timing":"3 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12","full_name":"Alex Carter"}},{"id":3,"comment":"Where is this? I need to go!","comment_timing":"3 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32","full_name":"Sofia Reyes"}}]

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));
String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  CommentsModel({List<Comments>? comments}) {
    _comments = comments;
  }

  CommentsModel.fromJson(dynamic json) {
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  List<Comments>? _comments;
  CommentsModel copyWith({List<Comments>? comments}) =>
      CommentsModel(comments: comments ?? _comments);
  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 157
/// comment : "Love this so much! ❤️"
/// comment_timing : "3 days ago"
/// user : {"id":1,"profile_image":"https://i.pravatar.cc/150?img=47","full_name":"Jenny Wilson"}

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  Comments({num? id, String? comment, String? commentTiming, User? user}) {
    _id = id;
    _comment = comment;
    _commentTiming = commentTiming;
    _user = user;
  }

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _comment = json['comment'];
    _commentTiming = json['comment_timing'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  String? _comment;
  String? _commentTiming;
  User? _user;
  Comments copyWith({num? id, String? comment, String? commentTiming, User? user}) => Comments(
    id: id ?? _id,
    comment: comment ?? _comment,
    commentTiming: commentTiming ?? _commentTiming,
    user: user ?? _user,
  );
  num? get id => _id;
  String? get comment => _comment;
  String? get commentTiming => _commentTiming;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['comment'] = _comment;
    map['comment_timing'] = _commentTiming;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// id : 1
/// profile_image : "https://i.pravatar.cc/150?img=47"
/// full_name : "Jenny Wilson"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({num? id, String? profileImage, String? fullName}) {
    _id = id;
    _profileImage = profileImage;
    _fullName = fullName;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _profileImage = json['profile_image'];
    _fullName = json['full_name'];
  }
  num? _id;
  String? _profileImage;
  String? _fullName;
  User copyWith({num? id, String? profileImage, String? fullName}) => User(
    id: id ?? _id,
    profileImage: profileImage ?? _profileImage,
    fullName: fullName ?? _fullName,
  );
  num? get id => _id;
  String? get profileImage => _profileImage;
  String? get fullName => _fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profile_image'] = _profileImage;
    map['full_name'] = _fullName;
    return map;
  }
}
