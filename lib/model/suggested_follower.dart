// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuggestedFollower {
  final String id;
  final String username;
  final String profileImageUrl;
  final bool isFollowing;

  SuggestedFollower(
      {required this.id,
      required this.username,
      required this.profileImageUrl,
      required this.isFollowing});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profileImageUrl': profileImageUrl,
      'isFollowing': isFollowing,
    };
  }

  factory SuggestedFollower.fromMap(Map<String, dynamic> map) {
    return SuggestedFollower(
      id: map['id'] as String,
      username: map['username'] as String,
      profileImageUrl: map['profileImageUrl'] as String,
      isFollowing: map['isFollowing'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestedFollower.fromJson(String source) =>
      SuggestedFollower.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<SuggestedFollower> suggestedFollowers = [
  SuggestedFollower(
    id: '1',
    username: 'Vin Diesel',
    profileImageUrl: 'assets/Vin Diesel.jpg',
    isFollowing: true,
  ),
  SuggestedFollower(
    id: '2',
    username: 'Dwayne Johnson',
    profileImageUrl: 'assets/Dwayne Johnson.jpeg',
    isFollowing: false,
  ),
  SuggestedFollower(
    id: '3',
    username: 'Jason Statham',
    profileImageUrl: 'assets/Jason Statham.jpeg',
    isFollowing: false,
  ),
  SuggestedFollower(
    id: '4',
    username: 'Jason Momoa',
    profileImageUrl: 'assets/Jason Momoa.jpg',
    isFollowing: true,
  ),
  SuggestedFollower(
    id: '5',
    username: 'Doraemon',
    profileImageUrl: 'assets/doraemon.jpeg',
    isFollowing: false,
  ),
];
