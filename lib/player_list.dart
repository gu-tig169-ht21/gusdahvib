  
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
  import 'state.dart';
  
  class PlayerList extends StatelessWidget{
  
   final List<Player> list;

   PlayerList(this.list);
  
   Widget build(BuildContext context){

    return ListView(
      children: list.map((player) => _item(player, context)).toList()
    );
  }

  Widget _item(player, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      
      child: 
          ListTile(
          leading: Checkbox(
          value: player.isChecked, 
          onChanged: (bool? value) {
          Provider.of<MyState>(context, listen: false).whenChanged(player, value);
             
          }, ),
          title: Text(player.message, style: TextStyle(fontSize: 20, decoration: player.isChecked? TextDecoration.lineThrough : null,)),
          trailing: IconButton(
            onPressed: () {
            Provider.of<MyState>(context, listen: false).removeText(player);
             },
            icon: const Icon(Icons.remove_circle_outline_outlined,
           ),
          ),
         ),
        
       
      
    );
  } 
}
