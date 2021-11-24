
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import './player_list.dart';
import './state.dart';


class MainView extends StatelessWidget{
  
  
  @override
  
  Widget build(BuildContext context) {
    var centerFloat;
    return Scaffold(
      appBar: AppBar(
        title: Text('Man Utd Player list',
        style: TextStyle(color: Colors.black87, fontSize: 24)),
         actions: [
          PopupMenuButton<int>(                                                 //En knapp man trycker på för att få upp ett filtreringsförslag
            icon: Icon(Icons.more_vert, color: Colors.white),                    
            onSelected: (value) {
            Provider.of<MyState>(context, listen: false).setFilterBy(value);           //Kopplat till MyState klassen som ligger i state.dart, 
            },
        
        itemBuilder: (context) => [
              PopupMenuItem(child: Text('All players'), value: 0),                     //Ett item kopplat till PopupMenuButton i detta fallet en String som har ett värde
              PopupMenuItem(child: Text('Selected players'), value: 1),
              PopupMenuItem(child: Text('Non-selected players'), value: 2),
            ]
          ),
        ],
      ),
     
      body: Consumer<MyState>(
      builder: (context, state, child) => 
       PlayerList(_filterList(state.list, state.filterBy)),
      ),
      
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
         Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
      }        
      ),
     

    );
    
  }
           List<Player> _filterList(list, filterBy){                              //Liten bit kod som gör att man kan filtrera de olika item i popupMenubutton
             if(filterBy == 0) return list;
             if(filterBy == 1)  
             return list.where((item) => item.isChecked == true).toList();
             if(filterBy == 2)
             return list.where((item) => item.isChecked == false).toList();
             return list;
                }

  }




