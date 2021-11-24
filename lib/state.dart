import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './api.dart';
import 'dart:convert';

class Player extends ChangeNotifier {
  String message;
  bool isChecked;
  String id;

  Player({this.id = '', required this.message, this.isChecked = false});

  static Map<String, dynamic> toJson(Player item){
    return {
      'title': item.message,
      'done': item.isChecked,

    };


}

  static Player fromJson(Map<String, dynamic> json){
    return Player(
     id: json['id'],
     message: json['title'],
     isChecked: json['done'],
    
    );
  }
}

class MyState extends ChangeNotifier {


  List<Player> _list = [];
  int _filterBy = 0;

  List<Player> get list => _list;

  int get filterBy => _filterBy;
  
  Future getLista() async {
    List<Player> list = await InternetFetcher.getPlayer();
    _list = list;
    notifyListeners();
  }

  void addText(Player player) async {
    
    _list = await InternetFetcher.addPlayer(player);
    notifyListeners();
  }

  void removeText(Player player) async {
   _list = await InternetFetcher.deletePlayer(player.id);
    notifyListeners();
  }

   void whenChanged(Player message, value) async{
    await InternetFetcher.putPlayer(message, value); 
    notifyListeners();
  }

   void setFilterBy(int filterBy) {
   
   this._filterBy = filterBy;
    
    notifyListeners();
   }

   

}
