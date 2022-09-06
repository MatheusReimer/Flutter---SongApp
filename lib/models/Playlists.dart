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
  static const String defaultImage = "";

  static const String defaultGenre = "";

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
  int? followers;
  String? id;

  factory Artists.fromJson(Map<String, dynamic> parsedJson) {
    return Artists(
        id: parsedJson['id'],
        image: parsedJson['images'].length > 0
            ? parsedJson['images'][0]['url']
            : defaultImage,
        name: parsedJson['name'],
        genres: parsedJson['genres'].length > 0
            ? parsedJson['genres'][0]
            : defaultGenre,
        followers: parsedJson['followers']['total']);
  }
}

class Playlists {
  static const String defaultImage = "";

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
    print(parsedJson['images'][0]['url']);
    return Playlists(
        description: parsedJson['description'],
        id: parsedJson['id'],
        image: parsedJson['images'].length > 0
            ? parsedJson['images'][0]['url']
            : defaultImage,
        name: parsedJson['name'],
        numberOfTracks: parsedJson['tracks']['total'],
        owner: parsedJson['owner']['display_name']);
  }
}
