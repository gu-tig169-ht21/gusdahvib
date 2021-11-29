import 'dart:convert';
import './state.dart';
import 'package:http/http.dart' as http;

const API_KEY = '0d8d9ad3-3880-4b3a-a63a-9b14338d18f6';                //En variabel man kan använda istället för att skriva ut hela API-key
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';        //En variabel man kan använda istället för att skriva ut hela URL:n

class InternetFetcher {



static Future<List<Player>> addPlayer(Player player) async {
   
    Map<String, dynamic> json = Player.toJson(player);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Player>((data) {
      return Player.fromJson(data);
    }).toList();
  }

  static Future deletePlayer(String playerId) async {
    var response = await http.delete(
        Uri.parse('$API_URL/todos/$playerId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Player>((data) {
      return Player.fromJson(data);
    }).toList();
  }

  static Future<List<Player>> getPlayer() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<Player>((data) {
      return Player.fromJson(data);
    }).toList();
  }

  static Future putPlayer(Player player, value) async {
    String playerId = player.id;
    player.isChecked = value;
    Map<String, dynamic> json = Player.toJson(player);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$playerId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  
    }
}