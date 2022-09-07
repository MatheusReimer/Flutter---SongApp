import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/Playlists.dart';

const String _baseSearchUrl = "https://api.spotify.com/v1/search?query=";

class SpotifyApiServices {
  static const String CLIENT_ID = "a2c989efb2424128a8c119801b508e73";
  static const String CLIENT_SECRET = "47b8345ee8a048e08a8bf48f4a3187d6";

  String _url = "https://accounts.spotify.com/api/token";
  Dio? _dio;

  SpotifyApiServices() {
    _dio = Dio();
  }
  Future<String> fetchToken() async {
    try {
      var response = await Dio().post(_url,
          queryParameters: {
            "grant_type": "client_credentials",
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      String token = response.data["access_token"];
      return token;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Playlists>> fetchPlaylistsByName(
      String token, String playlistId) async {
    var playlists = await Dio().get('$_baseSearchUrl$playlistId&type=playlist',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        }));
    List items = (playlists.data["playlists"]["items"]);

    List<Playlists> listOfPlaylist = [];
    for (int i = 0; i < items.length; i++) {
      Playlists playlistToList = Playlists.fromJson(items[i]);
      listOfPlaylist.add(playlistToList);
    }
    return listOfPlaylist;
  }

  Future<List<Artists>> searchArtists(String token, String artistName) async {
    var playlists = await Dio().get('$_baseSearchUrl$artistName&type=artist',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        }));
    List items = (playlists.data["artists"]["items"]);

    List<Artists> listOfArtists = [];
    for (int i = 0; i < items.length; i++) {
      Artists artistsToList = Artists.fromJson(items[i]);
      listOfArtists.add(artistsToList);
    }
    return listOfArtists;
  }
}
