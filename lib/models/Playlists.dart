import 'dart:convert';

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.artists,
  });

  String status;
  int totalResults;
  List<Artists> artists;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      artists: json["artists"]);
}

class Artists {
  Artists({
    this.name,
    this.image,
    this.genres,
    this.followers,
    this.id,
  });

  String? name;
  String? image;
  String? genres;
  String? followers;
  String? id;

  Map<String, dynamic> toJsonAttr() => {
        'name': name,
        'image': image,
        'genres': genres,
        'followers': followers,
        'id': id
      };
}

class Playlists {
  String? id;
  String? name;
  String? owner;
  String? image;
  String? description;
  int? numberOfTracks;

  Playlists({
    this.id,
    this.name,
    this.owner,
    this.image,
    this.description,
    this.numberOfTracks,
  });

  factory Playlists.fromJson(Map<String, dynamic> parsedJson) {
    return Playlists(
        description: parsedJson['description'],
        id: parsedJson['id'],
        image: parsedJson['images'][0]['url'],
        name: parsedJson['name'],
        numberOfTracks: parsedJson['tracks']['total'],
        owner: parsedJson['owner']['display_name']);
  }
}
