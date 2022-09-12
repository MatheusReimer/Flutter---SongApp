import 'dart:convert';

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.artists,
  });

  String status;
  int totalResults;
  List<ArtistsMyModel> artists;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      artists: json["artists"]);
}

class ArtistsMyModel {
  static const String defaultImage = "";

  static const String defaultGenre = "";

  ArtistsMyModel({
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

  factory ArtistsMyModel.fromJson(Map<String, dynamic> parsedJson) {
    return ArtistsMyModel(
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

class PlaylistsModel {
  static const String defaultImage = "";

  String? id;
  String? name;
  String? owner;
  String? image;
  String? description;
  int? numberOfTracks;
  bool? error;

  PlaylistsModel(
      {this.id,
      this.name,
      this.owner,
      this.image,
      this.description,
      this.numberOfTracks,
      this.error});

  factory PlaylistsModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['images'][0]['url']);
    return PlaylistsModel(
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
