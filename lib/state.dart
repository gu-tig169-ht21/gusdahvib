import 'package:flutter/material.dart';

class Player extends ChangeNotifier {
  String message;
  bool isChecked;

  Player({required this.message, this.isChecked = false});

}

class MyState extends ChangeNotifier {
  
  List<Player> _list = [];
  int _filterBy = 0;

  List<Player> get list => _list;

  int get filterBy => _filterBy;


  void addText(Player player) {
    list.add(player);
    notifyListeners();
  }

  void removeText(Player player) {
    list.remove(player);
    notifyListeners();
  }

  void whenChanged(Player message, value) {
    message.isChecked = value;
    notifyListeners();
  }

   void setFilterBy(int filterBy) {
   
   this._filterBy = filterBy;
    
    notifyListeners();
   }

}
