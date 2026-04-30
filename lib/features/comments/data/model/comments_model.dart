import 'dart:convert';

/// comments : [{"id":176,"comment":"Incredible shot!","comment_timing":"2 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":177,"comment":"Can't stop looking at this 👀","comment_timing":"2 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12"}},{"id":178,"comment":"So beautiful! 🌟","comment_timing":"2 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32"}},{"id":179,"comment":"This is everything! 💯","comment_timing":"2 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15"}},{"id":137,"comment":"Incredible shot!","comment_timing":"2 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":138,"comment":"Can't stop looking at this 👀","comment_timing":"2 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12"}},{"id":139,"comment":"So beautiful! 🌟","comment_timing":"2 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32"}},{"id":93,"comment":"Incredible shot!","comment_timing":"2 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":94,"comment":"Can't stop looking at this 👀","comment_timing":"2 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12"}},{"id":95,"comment":"So beautiful! 🌟","comment_timing":"2 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32"}},{"id":96,"comment":"This is everything! 💯","comment_timing":"2 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15"}},{"id":97,"comment":"Wow, amazing! 🔥","comment_timing":"2 days ago","user":{"id":5,"profile_image":"https://i.pravatar.cc/150?img=44"}},{"id":59,"comment":"Incredible shot!","comment_timing":"2 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":60,"comment":"Can't stop looking at this 👀","comment_timing":"2 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12"}},{"id":61,"comment":"So beautiful! 🌟","comment_timing":"2 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32"}},{"id":62,"comment":"This is everything! 💯","comment_timing":"2 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15"}},{"id":23,"comment":"Incredible shot!","comment_timing":"2 days ago","user":{"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}},{"id":24,"comment":"Can't stop looking at this 👀","comment_timing":"2 days ago","user":{"id":2,"profile_image":"https://i.pravatar.cc/150?img=12"}},{"id":25,"comment":"So beautiful! 🌟","comment_timing":"2 days ago","user":{"id":3,"profile_image":"https://i.pravatar.cc/150?img=32"}},{"id":26,"comment":"This is everything! 💯","comment_timing":"2 days ago","user":{"id":4,"profile_image":"https://i.pravatar.cc/150?img=15"}},{"id":27,"comment":"Wow, amazing! 🔥","comment_timing":"2 days ago","user":{"id":5,"profile_image":"https://i.pravatar.cc/150?img=44"}}]

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

/// id : 176
/// comment : "Incredible shot!"
/// comment_timing : "2 days ago"
/// user : {"id":1,"profile_image":"https://i.pravatar.cc/150?img=47"}

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

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({num? id, String? profileImage}) {
    _id = id;
    _profileImage = profileImage;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _profileImage = json['profile_image'];
  }
  num? _id;
  String? _profileImage;
  User copyWith({num? id, String? profileImage}) =>
      User(id: id ?? _id, profileImage: profileImage ?? _profileImage);
  num? get id => _id;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profile_image'] = _profileImage;
    return map;
  }
}
