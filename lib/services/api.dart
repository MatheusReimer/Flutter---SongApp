import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:songapp/models/AcessToken.dart';
import 'package:songapp/models/Auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/Devices.dart';
import '../models/Playlists.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _baseSearchUrl = "https://api.spotify.com/v1/search?query=";
const String _basePlayerUrl = "https://api.spotify.com/v1/me/player";

class SpotifyApiServices {
  final String CLIENT_ID = "a2c989efb2424128a8c119801b508e73";
  final String CLIENT_SECRET = "47b8345ee8a048e08a8bf48f4a3187d6";

  final String _url = "https://accounts.spotify.com/api/token";
  final String _auth = 'https://accounts.spotify.com/authorize';
  final String _redirectUri = 'https://musiquizz-26e41.web.app';
  Dio? _dio;
  final storage = const FlutterSecureStorage();

  String scope = 'user-read-playback-state user-read-playback-position';

  SpotifyApiServices() {
    _dio = Dio();
  }

  Future<String> authTokenForUriRedirect() async {
    try {
      var response = await Dio().get(_auth,
          queryParameters: {
            'client_id': CLIENT_ID,
            'response_type': 'code',
            'redirect_uri': _redirectUri,
            'scope': scope
          },
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: Headers.jsonContentType,
          }));
      String token = response.realUri.toString();
      return token;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void launchURLAuth() async {
    final url = Uri.parse(
        'https://accounts.spotify.com/authorize?client_id=${CLIENT_ID}&response_type=code&scope=${scope}&redirect_uri=${_redirectUri}');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
    }
  }

  Future<AccessToken> changeCodeForToken(TokenModel code) async {
    try {
      var response = await Dio().post(_url,
          queryParameters: {
            "grant_type": "authorization_code",
            "code": code.code,
            "redirect_uri": _redirectUri,
          },
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization":
                'Basic ${base64Encode(utf8.encode('$CLIENT_ID:$CLIENT_SECRET'))}'
          }));
      AccessToken accessToken = AccessToken.fromJson(response.data);
      await saveTokens(accessToken);
      return accessToken;
    } catch (e) {
      refreshToken();
      print(e);
      rethrow;
    }
  }

  Future<String> getUserToken() async {
    try {
      var token = await storage.read(key: 'token');
      return token.toString();
    } catch (e) {
      return "no tokens found";
    }
  }

  Future<AccessToken> refreshToken() async {
    var refreshedToken = await storage.read(key: 'refreshToken');
    var response = await Dio()
        .post(_url,
            queryParameters: {
              "grant_type": "refresh_token",
              "refresh_token": refreshedToken
            },
            options: Options(
                contentType: Headers.formUrlEncodedContentType,
                headers: {
                  "Authorization":
                      'Basic ${base64Encode(utf8.encode('$CLIENT_ID:$CLIENT_SECRET'))}'
                }))
        .catchError((error) {
      print(error.response);
      return error.response;
    });
    AccessToken accessToken = AccessToken.fromJson(response.data);
    await saveTokens(accessToken);
    return accessToken;
  }

  saveTokens(AccessToken accessToken) async {
    await storage.write(key: 'refreshToken', value: accessToken.refreshToken);
    await storage.write(key: 'accessToken', value: accessToken.accessToken);
  }

  Future<List<PlaylistsModel>> fetchPlaylistsByName(
      String token, String playlistId) async {
    try {
      var playlists =
          await Dio().get('$_baseSearchUrl$playlistId&type=playlist',
              options: Options(headers: {
                HttpHeaders.authorizationHeader: 'Bearer $token',
                HttpHeaders.contentTypeHeader: 'application/json',
              }));
      List items = (playlists.data["playlists"]["items"]);

      List<PlaylistsModel> listOfPlaylist = [];
      for (int i = 0; i < items.length; i++) {
        PlaylistsModel playlistToList = PlaylistsModel.fromJson(items[i]);
        listOfPlaylist.add(playlistToList);
      }
      return listOfPlaylist;
    } catch (e) {
      print(e);
      refreshToken();
      return Future.error('Error');
    }
  }

  Future<List<ArtistsMyModel>> searchArtists(
      String token, String artistName) async {
    var playlists = await Dio().get('$_baseSearchUrl$artistName&type=artist',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        }));
    List items = (playlists.data["artists"]["items"]);

    List<ArtistsMyModel> listOfArtists = [];
    for (int i = 0; i < items.length; i++) {
      ArtistsMyModel artistsToList = ArtistsMyModel.fromJson(items[i]);
      listOfArtists.add(artistsToList);
    }
    return listOfArtists;
  }

  Future<List<Device>> playerDevices(String token) async {
    try {
      var playlists = await Dio().get('$_basePlayerUrl/devices',
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'application/json',
          }));
      List items = (playlists.data['devices']);
      List<Device> listOfDevices = [];
      for (int i = 0; i < items.length; i++) {
        Device playlistToList = Device.fromJson(items[i]);
        listOfDevices.add(playlistToList);
      }
      return listOfDevices;
    } catch (e) {
      print(e);
      refreshToken();
      rethrow;
    }
  }
}
